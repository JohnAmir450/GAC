import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/checkout/data/models/shipping_address_model.dart';
import 'package:gac/features/checkout/domain/entities/checkout_product_details.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/generated/l10n.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/chache_helper_keys.dart';

part 'account_manager_state.dart';

class AccountManagerCubit extends Cubit<AccountManagerState> {
  final AuthRepo authRepo;
  final OrdersRepo ordersRepo;
  
  AccountManagerCubit(this.authRepo, this.ordersRepo)
      : super(AccountManagerInitialState());

  final TextEditingController? firstNameController = TextEditingController();
  final TextEditingController? secondNameController = TextEditingController();
  final TextEditingController? phoneNumberController = TextEditingController();
  bool hasChanges = false;
  Icon arrowIcon = const Icon(Icons.arrow_forward_ios);
  bool orderVisibleOrderDetails = false;
  int userPoints = 0;
  final formKey = GlobalKey<FormState>();

  void changeProductDetailsVisibility() {
    orderVisibleOrderDetails = !orderVisibleOrderDetails;
    arrowIcon = orderVisibleOrderDetails
        ? const Icon(Icons.arrow_back_ios)
        : const Icon(Icons.arrow_forward_ios);

    emit(ChangeProductDetailsVisibilityState());
  }

  Future<User> getCurrentUser() async {
    return await authRepo.getCurrentUser();
  }

  Future<void> updateUserData() async {
    emit(AccountManagerUpdateUserDataLoadingState());
    var result = await authRepo.updateUserData(
      uId: getUserData().uId,
      name: firstNameController!.text,
      secondName: secondNameController!.text,
      phoneNumber: phoneNumberController!.text,
    );
    result.fold((failure) {
      emit(AccountManagerUpdateUserDataFailureState(
          errorMessage: failure.message));
    }, (data) {
      authRepo.saveUserData(
          userEntity: UserEntity(
        name: firstNameController!.text,
        secondName: secondNameController!.text,
        phoneNumber: phoneNumberController!.text,
        email: getUserData().email,
        uId: getUserData().uId,
      ));
      emit(AccountManagerUpdateUserDataSuccessState());
    });
  }

  void userDataChanged() {
    hasChanges = true;
    emit(AccountManagerHasChangesState());
  }

  Future<void> signOut() async {
    await ordersRepo.emptyCart(userId: getUserData().uId);
    await authRepo.signOut();
  }

  Future<bool> reauthenticateUser(String password) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null || user.email == null) return false;

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);

      return true; // ✅ Authentication successful
    } catch (e) {
      return false; // ❌ Authentication failed
    }
  }

  Future<void> deleteAccount({required String uId, String? password}) async {
    try {
      if (password != null) {
        bool isAuthenticated = await reauthenticateUser(password);
        if (!isAuthenticated) {
          emit(DeleteAccountFailureState(errorMessage: "Reauthentication failed"));
          return;
        }
      }

      var result = await authRepo.deleteAccount(uId: uId,password: password);
      result.fold(
        (failure) {
          emit(DeleteAccountFailureState(errorMessage: failure.message));
        },
        (deleted) => emit(DeleteAccountSuccessState()),
      );
    } catch (e) {
      emit(DeleteAccountFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> fetchUserOrders({Map<String, dynamic>? query}) async {
    try {
      emit(FetchUserOrdersLoadingState());
      var result = await ordersRepo.fetchUserOrders(
          userId: getUserData().uId, query: query);
      result.fold((failure) {
        emit(FetchUserOrdersLFailureState(errorMessage: failure.message));
      }, (orders) {
        emit(FetchUserOrdersSuccessState(
          orders: orders,
        ));
      });
    } catch (e) {
      emit(FetchUserOrdersLFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> saveShippingData(
      BuildContext context, ShippingAddressEntity shippingAddressEntity) async {
    try {
      final shippingModel =
          ShippingAddressModel.fromEntity(shippingAddressEntity);
      final shippingData = jsonEncode(shippingModel.toJson());
      await CacheHelper.saveData(
          key: kSaveUserLocationKey, value: shippingData);

      showSnackBar(context,
          text: S.of(context).data_saved_success, color: AppColors.primaryColor);
    } catch (e) {
      showSnackBar(context, text: S.of(context).data_save_error);
    }
  }

  Future<void> getUserPoints({required String userId}) async {
    userPoints = await ordersRepo.getUserPoints(userId: userId);
    emit(GetUserPointsState());
  }

  Future<void> cancelOrder(BuildContext context,
      {required String orderNumber}) async {
    try {
      await ordersRepo.cancelOrder(orderNumber: orderNumber);
      showSnackBar(context,
          text: S.of(context).order_canceled_success, color: AppColors.primaryColor);
      await fetchUserOrders();
    } catch (e) {
      showSnackBar(context, text: S.of(context).order_cancel_error);
    }
  }

  Future<void> updateDataIfOrderCancelled({
    required String orderId,
    required List<CheckoutProductDetails> products,
  }) async {
    await updateProductSellingCountIfCancelled(orderId: orderId);
    await ordersRepo.updateProductQuantityIfCancelled(
      orderId: orderId,
      products: products,
    );
    await updateUserPointsIfCancelled(
        userId: getUserData().uId, products: products);
  }

  Future<void> updateUserPointsIfCancelled({
    required String userId,
    required List<CheckoutProductDetails> products,
  }) async {
    int totalQuantity =
        products.fold(0, (sum, product) => sum + product.productQuantity);
    await ordersRepo.updateUserPoints(
      operator: '-',
      userId: userId,
      quantitySold: totalQuantity,
    );
  }

  Future<void> updateProductSellingCountIfCancelled(
      {required String orderId}) async {
    await ordersRepo.updateProductSellingCountIfCancelled(orderId: orderId);
  }
}
