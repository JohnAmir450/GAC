import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'product_types_state.dart';

class ProductTypesCubit extends Cubit<ProductTypesState> {
  final ProductsRepo productsRepo;
  ProductTypesCubit(this.productsRepo) : super(ProductTypesInitialState());

  Future<void> getProductsByType(
      {required String categoryType}) async {
    emit(GetProductByTypeLoadingState());
    var result =
        await productsRepo.getProductsByType(productType: categoryType);
    result.fold((failure) {
      emit(GetProductByTypeFailureState(errorMessage: failure.message));
    }, (products) {
      emit(GetProductByTypeSuccessState(products: products));
    });
    
  }
}
