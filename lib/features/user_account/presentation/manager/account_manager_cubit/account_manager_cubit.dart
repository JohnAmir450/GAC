import 'dart:convert';

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
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/chache_helper_keys.dart';

part 'account_manager_state.dart';

class AccountManagerCubit extends Cubit<AccountManagerState> {
  final AuthRepo authRepo;
  final OrdersRepo ordersRepo;
  AccountManagerCubit(this.authRepo, this.ordersRepo) : super(AccountManagerInitialState());
  final TextEditingController? firstNameController = TextEditingController();
  final TextEditingController? secondNameController = TextEditingController();
  final TextEditingController? phoneNumberController = TextEditingController();
  bool hasChanges = false;
  Icon arrowIcon=const Icon(Icons.arrow_forward_ios);
  bool orderVisibleOrderDetails=false;
  final formKey = GlobalKey<FormState>();



void changeProductDetailsVisibility() {
    orderVisibleOrderDetails = !orderVisibleOrderDetails;
    arrowIcon = orderVisibleOrderDetails? const Icon(Icons.arrow_back_ios):const Icon(Icons.arrow_forward_ios);
        
       
        emit(ChangeProductDetailsVisibilityState());
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
              uId: getUserData().uId,));
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

  Future<void> deleteAccount({required String uId}) async {
    var result = await authRepo.deleteAccount(uId: uId);
    result.fold(
        (failure) =>
            emit(DeleteAccountFailureState(errorMessage: failure.message)),
        (deleted) => emit(DeleteAccountSuccessState()));
  }

   Future<void> fetchUserOrders( {Map<String, dynamic>? query}) async {
    try {
      emit(FetchUserOrdersLoadingState());
      var result = await ordersRepo.fetchUserOrders(userId: getUserData().uId,query: query);
      result.fold((failure) {
        emit(FetchUserOrdersLFailureState(errorMessage: failure.message));
      }, (orders) {
        emit(FetchUserOrdersSuccessState(orders: orders));
      });
    } catch (e) {
      emit(FetchUserOrdersLFailureState(errorMessage: e.toString()));
    }
  }

   Future<void> saveShippingData(
      BuildContext context, ShippingAddressEntity shippingAddressEntity) async {
    try {
      final shippingModel = ShippingAddressModel.fromEntity(shippingAddressEntity);
      final shippingData = jsonEncode(shippingModel.toJson());
      await CacheHelper.saveData(key: kSaveUserLocationKey, value: shippingData);

      showSnackBar(context,
          text: 'تم حفظ البيانات بنجاح', color: AppColors.primaryColor);
    } catch (e) {
      showSnackBar(context, text: 'حدث خطأ في حفظ البيانات');
    }
  }
    Future <void> cancelOrder(BuildContext context,{required String orderNumber})async{
      try {
  await ordersRepo.cancelOrder(orderNumber: orderNumber);
        showSnackBar(context, text: 'تم الغاء الطلب بنجاح', color: AppColors.primaryColor);
  await fetchUserOrders();
}  catch (e) {
      showSnackBar(context, text: 'حدث خطأ في الغاء الطلب');
}
    }
}
