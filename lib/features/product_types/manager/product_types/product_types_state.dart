part of 'product_types_cubit.dart';

@immutable
sealed class ProductTypesState {}

final class ProductTypesInitialState extends ProductTypesState {}

final class GetProductByTypeSuccessState extends ProductTypesState {
  final List<ProductEntity> products;

  GetProductByTypeSuccessState({required this.products});
}

final class GetProductByTypeFailureState extends ProductTypesState {
  final String errorMessage;

  GetProductByTypeFailureState({required this.errorMessage});
}

final class GetProductByTypeLoadingState extends ProductTypesState {}