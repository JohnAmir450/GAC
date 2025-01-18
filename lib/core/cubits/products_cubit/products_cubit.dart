import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsInitialState());
  int productQuantity = 1;
  int productLength = 0;

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void getBestSellingProducts() async {
    emit(ProductsLoadingState());
    var result = productsRepo.getBestSellingProducts();
    result.fold((failure) {
      emit(ProductsFailureState(errorMessage: failure.message));
    }, (stream) {
      stream.listen((products) {
        emit(ProductsSuccessState(products: products));
      }, onError: (error) {
        emit(ProductsFailureState(errorMessage: error.toString()));
      });
    });
  }

  // Future<void> getProducts() async {
  //   emit(ProductsLoadingState());
  //   var result = await productsRepo.getProducts();
  //   result.fold((failure) {
  //     emit(ProductsFailureState(errorMessage:  failure.message));
  //   }, (products) {
  //     emit(ProductsSuccessState(products: products));
  //   });
  // }
  void getProducts({
    Map<String, dynamic>? query,
  }) {
    emit(ProductsLoadingState());
    final result = productsRepo.getProductsStream(
      query: query,
    );

    result.fold((failure) {
      emit(ProductsFailureState(errorMessage: failure.message));
    }, (stream) {
      stream.listen((products) {
        productLength = products.length;
        emit(ProductsSuccessState(products: products));
      }, onError: (error) {
        emit(ProductsFailureState(errorMessage: error.toString()));
      });
    });
  }

  // Future<void> addToCart({required CartModel cartModel}) async{

  //   var result= await productsRepo
  //       .addToCart(userId: getUserData().uId, cartModel: cartModel);
  //   result.fold((failure) {
  //     emit(AddToCartFailureState(errorMessage: failure.message));
  //   }, (value) {
  //     emit(AddToCartSuccessState());
  //   });

  // }
  Future<void> searchProducts(String searchText) async {
    emit(ProductsLoadingState());
    try {
      final products = await productsRepo.searchProducts(searchController.text);
      productLength = products.length;
      emit(ProductsSuccessState(products: products));
    } catch (e) {
      emit(ProductsFailureState(errorMessage: e.toString()));
    }
  }
}
