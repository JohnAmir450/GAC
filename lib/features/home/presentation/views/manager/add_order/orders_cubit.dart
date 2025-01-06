import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(AddOrderInitialState());
  final OrdersRepo ordersRepo;

  void addOrder({required OrderEntity orderEntity}) async {
    emit(AddOrderLoadingState());
    final result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold((failure) => emit(AddOrderFailureState(errorMessage: failure.message)),
        (success) async{
              await ordersRepo.emptyCart(userId: getUserData().uId);
             emit(AddOrderSuccessState());
        });
  }
}
