import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/features/auth/data/models/user_model.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(AddOrderInitialState());
  final OrdersRepo ordersRepo;
  bool governamentChanged=false;
  void changed(){
    governamentChanged=true;
    emit(GovernmentChanged());
  }

  void addOrder({required OrderEntity orderEntity}) async {
    emit(AddOrderLoadingState());
    final result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold(
        (failure) => emit(AddOrderFailureState(errorMessage: failure.message)),
        (success) async {
      for (var cartItem in orderEntity.cartItems) {
        await ordersRepo.updateProductStock(
          productCode: cartItem.productEntity.code,
          quantitySold: cartItem.quantity,
        );
      }
      await ordersRepo.emptyCart(userId: getUserData().uId);
      emit(AddOrderSuccessState());
    });
  }

  Future<void> updateUserPhoneNumber(
      {required String uId, required String phoneNumber}) async {
    var result =
        await ordersRepo.updatePhoneNumber(uId: uId, phoneNumber: phoneNumber);
    result.fold((failure) {}, (user) {});
  }

  void updatePhoneNumberIfNeeded(BuildContext context, String phoneNumber) {
    UserModel userData = getUserData();

    if (userData.phoneNumber.isEmpty ) {
      context.read<OrdersCubit>().updateUserPhoneNumber(
            uId: userData.uId,
            phoneNumber: phoneNumber,
          );

      var updatedUser = userData.copyWith(phoneNumber: phoneNumber);
      CacheHelper.saveData(
        key: kSaveUserDataKey,
        value: jsonEncode(updatedUser.toMap()),
      );
    }
  }

  
}
