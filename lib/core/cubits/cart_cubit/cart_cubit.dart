import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(
    this.cartRepo,
  ) : super(CartCubitInitialState());

 

  Stream<List<CartEntity>> get cartProductsStream => cartRepo.getCartProducts(userId: getUserData().uId).fold(
      (failure) => Stream.error(failure.message),
      (stream) => stream,
    );


  Future<void> changeProductQuantity(String productId, int cartQuantity) async {
    var result = await cartRepo.changeProductQuantity(productId, cartQuantity);
    result.fold((failure) {
      emit(CartCubitProductQuantityExceeds(exceedsMessage: failure.message));
    }, (value) {
      emit(CartCubitChangeProductQuantity());
    });
  }

  void getCartProducts() async {
    emit(CartCubitGetProductsLoadingState());
    var result = cartRepo.getCartProducts(
      userId: getUserData().uId,
    );
    result.fold((failure) {
      emit(CartCubitGetProductsFailureState(errorMessage: failure.message));
    }, (stream) {
      stream.distinct().listen((products) {
       
        emit(CartCubitGetProductsSuccessState(products: products,
          ));
      }, onError: (error) {
        emit(CartCubitGetProductsFailureState(errorMessage: error.toString()));
      });
    });
  }

  Future<void> addToCart({required CartModel cartModel}) async {
    var result = await cartRepo.addToCart(
        userId: getUserData().uId, cartModel: cartModel);
    result.fold((failure) {
      emit(AddToCartFailureState(errorMessage: failure.message));
    }, (value) {
      emit(AddToCartSuccessState());
    });
  }

  Future<void> removeCartItem({
    required  String productCode,
  }) async {
    final result = await cartRepo.removeFromCart(
        userId: getUserData().uId, productCode: productCode);
    result.fold(
      (failure) {
        emit(CartCubitGetProductsFailureState(errorMessage: failure.message));
      },
      (_) {
        getCartProducts();
        emit(RemoveCartItemSuccessState());
      },
    );
  }



Stream<double> getProductPriceStream(String productCode) {
  
  return cartRepo.getProductPrice(productCode);
}



 double getTotalPrice(List<CartEntity> products) {
  double totalPrice = 0;
  for (var product in products) {
    totalPrice += product.productEntity.price * product.quantity;
  }
  return totalPrice;
}





}
