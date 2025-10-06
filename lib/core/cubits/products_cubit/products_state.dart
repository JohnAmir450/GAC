part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsFailureState extends ProductsState {
  final String errorMessage;

  ProductsFailureState({required this.errorMessage});
}

final class ProductsSuccessState extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccessState({required this.products});
}


final class AddToCartSuccessState extends ProductsState {
  
}
final class AddToCartFailureState extends ProductsState {
  final String errorMessage;  
  AddToCartFailureState({required this.errorMessage});
}

final class GetNotificationsLoadingState extends ProductsState {}

final class GetNotificationsSuccessState extends ProductsState {
  final List<NotificationModel> notifications;

  GetNotificationsSuccessState({required this.notifications});
}

final class GetNotificationsFailureState extends ProductsState {
  final String errorMessage;

  GetNotificationsFailureState({required this.errorMessage});
}

class CheckUserEmailVerification extends ProductsState {
  final bool isVerified;
  CheckUserEmailVerification({this.isVerified = false});
}