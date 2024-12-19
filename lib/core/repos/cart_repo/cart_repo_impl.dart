import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/database_service.dart';

import '../../utils/backend_endpoints.dart';

class CartRepoImpl implements CartRepo {
  final DatabaseService databaseService;

  const CartRepoImpl({required this.databaseService});
  @override
  Either<Failure, Stream<List<CartEntity>>> getCartProducts(
      {required String userId, Map<String, dynamic>? query}) {
    try {
      final stream = databaseService
          .getDataStream(
        field: ('cartList'),
        path: BackendEndpoints.getUserData,
        query: query,
        documentId: userId,
      )
          .map((data) {
        return data.map((e) => CartModel.fromJson(e).toEntity()).toList();
      });
      print(stream.first);
      return Right(stream);
    } catch (e) {
      return Left(
          ServerFailure(message: 'فشل في تحميل المنتجات، حاول مرة اخرى!'));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart({
    required String userId,
    required CartModel cartModel,
  }) async {
    try {
      // Create the new cart item
      final cartItem = CartModel(
        productModel: cartModel.productModel,
        quantity: 1,
      );

      // Path to the user's data in Firestore
      final path = '${BackendEndpoints.getUserData}/$userId';
      final userRef = FirebaseFirestore.instance.doc(path);

      // Fetch the current cart list
      final userSnapshot = await userRef.get();
      if (!userSnapshot.exists) {
        return Left(ServerFailure(message: "User data not found"));
      }

      // Get the existing cart list
      final cartList = List<Map<String, dynamic>>.from(
        userSnapshot.data()?['cartList'] ?? [],
      );

      // Check if the product is already in the cart
      final isProductInCart = cartList.any((item) {
        return item['productModel']['code'] == cartModel.productModel.code;
      });

      if (isProductInCart) {
        // If the product is already in the cart, return a failure or handle as needed
        return Left(
            ServerFailure(message: 'المنتج بالفعل موجود في سلة التسوق'));
      }

      // Add the new product to the cart
      await userRef.update({
        'cartList': FieldValue.arrayUnion([cartItem.toJson()]),
      });

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changeProductQuantity(
      String productId, int cartQuantity) async {
    try {
      // Fetch the current user's cart data
      final userDoc = await databaseService.getData(
        path: 'users',
        documentId: getUserData().uId,
      );

      final cartList = List<Map<String, dynamic>>.from(userDoc['cartList']);

      for (var product in cartList) {
        final productModel = product['productModel'];
        if (productModel != null && productModel['code'] == productId) {
          // Fetch product details from the products collection
          final productDoc = await databaseService.getData(
            path: 'products',
            documentId: productId,
          );

          // Check if the requested quantity exceeds the available stock
          if (productDoc['productQuantity'] < cartQuantity) {
            return left(
              ServerFailure(
                message:
                    'الكمية المطلوبة غير متوفرة الآن، الكمية المتاحة هي: (${productDoc['productQuantity']}).',
              ),
            );
          }

          // Update the cart with the new quantity
          product['quantity'] = cartQuantity;
          await databaseService.updateData(
            path: 'users',
            documentId: getUserData().uId,
            data: {'cartList': cartList},
          );
          return right(null);
        }
      }

      // Return failure if the product is not found in the cart
      return left(
        ServerFailure(
          message: 'المنتج غير موجود في السلة.',
        ),
      );
    } catch (e) {
      // Return a failure for any other unexpected error
      return left(
        ServerFailure(
          message: 'حدث خطأ غير متوقع: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(
      {required String userId, required String productCode}) async {
    try {
      await databaseService.removeItemFromCart(
        userId: userId,
        productCode: productCode,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(
          message: 'Error removing item from cart: ${e.toString()}'));
    }
  }

  // @override
  // Stream<double> getProductPrice(String productCode) {
  //   return databaseService.getProductPriceStream(productCode: productCode)
  //       as Stream<double>;
  // }
  @override
  Stream<double> getProductPrice(String productCode) {
    final Stream<double> priceStream = databaseService.getProductPriceStream(
        productCode: productCode) as Stream<double>;

    // Step 2: Listen for price changes
    priceStream.listen((newPrice) async {
      try {
        final userSnapshot = await databaseService.getData(
          path: 'users',
          documentId: getUserData().uId,
        );

        // Step 3: Access the user's cartList directly
        final cartList = userSnapshot['cartList'] as List<dynamic>;

        List<dynamic> updatedCartList = cartList.map((item) {
          if (item['productModel']['code'] == productCode) {
            item['productModel']['price'] = newPrice;
          }
          return item;
        }).toList();

        // Step 4: Update the user's cartList in Firestore
        await databaseService.updateData(
          path: 'users',
          documentId: getUserData().uId,
          data: {'cartList': updatedCartList},
        );
      } catch (e) {
        print('Error updating product price: $e');
      }
    });

    return priceStream; // Returning the priceStream for completeness
  }
}
