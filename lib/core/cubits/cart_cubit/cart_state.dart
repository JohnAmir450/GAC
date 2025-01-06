part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartCubitInitialState extends CartState {}

final class CartCubitGetProductsSuccessState extends CartState {
  final List<CartEntity> products;

  
  CartCubitGetProductsSuccessState( {required this.products});
}

final class CartCubitGetProductsFailureState extends CartState {
  final String errorMessage;  

  CartCubitGetProductsFailureState({required this.errorMessage});
}

final class AddToCartFailureState extends CartState {
  final String errorMessage;  

  AddToCartFailureState({required this.errorMessage});
}

final class CartCubitGetProductsLoadingState extends CartState {}

final class CartCubitChangeProductQuantity extends CartState {}

final class AddToCartSuccessState extends CartState {}

final class RemoveCartItemSuccessState extends CartState {}

final class CartCubitProductQuantityExceeds extends CartState {
  final String exceedsMessage;

  CartCubitProductQuantityExceeds({required this.exceedsMessage});
}
final class CartCubitGetStreamedPrice extends CartState {}