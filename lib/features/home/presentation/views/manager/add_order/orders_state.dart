part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class AddOrderInitialState extends OrdersState {}

final class AddOrderLoadingState extends OrdersState {}

final class AddOrderSuccessState extends OrdersState {}

final class AddOrderFailureState extends OrdersState {
  final String errorMessage;

  AddOrderFailureState({required this.errorMessage});
}
final class GovernmentChanged extends OrdersState {}

final class PointsRedeemedState extends OrdersState {}
final class PointsLoadingRedeemState extends OrdersState {}