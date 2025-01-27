import 'package:dartz/dartz.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/database_service.dart';
import 'package:gac/core/utils/backend_endpoints.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/checkout/domain/entities/checkout_product_details.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity orderEntity}) async {
    try {
      await databaseService.addData(
        uId: orderEntity.orderId,
          path: BackendEndpoints.addOrders,
          data: OrderModel.fromEntity(orderEntity).toJson());

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> emptyCart({required String userId}) async {
    try {
      await databaseService.emptyCart(userId: userId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePhoneNumber({
    required String uId,
    required String phoneNumber,
  }) async {
    try {
      // Update phone number in the database
      await databaseService.updateData(
        path: BackendEndpoints.getUserData,
        documentId: uId,
        data: {'phoneNumber': phoneNumber},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to update phone number.'));
    }
  }

  @override
  Future<void> updateProductStock(
      {required String productCode, required int quantitySold}) async {
    // Fetch the current stock of the product
    var productData = await databaseService.getData(
        path: BackendEndpoints.getProducts, documentId: productCode);

    if (productData != null) {
      int currentStock = productData['productQuantity'] ?? 0;

      // Calculate the new stock
      int updatedStock = currentStock - quantitySold;

      // Update the stock in the database
      await databaseService.updateData(
        path: BackendEndpoints.getProducts,
        documentId: productCode,
        data: {'productQuantity': updatedStock},
      );
    } else {
      throw Exception('Product not found');
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> fetchUserOrders(
      {required String userId, Map<String, dynamic>? query}) async {
    try {
      // Fetch data from Firestore
      List<Map<String, dynamic>> ordersData = await databaseService.getData(
          path: BackendEndpoints.getOrders,
          filterValue: 'uID',
          filterValueEqualTo: userId,
          query: query);

      // Map the fetched data into OrderEntity list
      List<OrderModel> orders =
          ordersData.map((order) => OrderModel.fromJson(order)).toList();

      return Right(orders);
    } catch (e) {
      // Return the failure if an error occurs
      return Left(ServerFailure(message: e.toString()));
    }
  }
 @override
Future<Either<Failure, void>> cancelOrder({required String orderNumber}) async {
  try {
    // Query the database to find the order with the specified orderNumber
    final List<Map<String, dynamic>> queryResult = await databaseService.getData(
      path: BackendEndpoints.getOrders,
      filterValue: 'orderId', // Adjust the filter key to match your data model
      filterValueEqualTo: orderNumber,
    );

    // Check if an order with the given orderNumber exists
    if (queryResult.isEmpty) {
      return Left(ServerFailure(message: 'Order not found.'));
    }

    // Assuming orderNumber is unique, get the first matching document
    final orderData = queryResult.first;
    final documentId = orderData['orderId']; // Ensure your Firestore query includes the document ID

    if (documentId == null) {
      return Left(ServerFailure(message: 'Order document ID not found.'));
    }

    // Delete the order document using its documentId
    await databaseService.deleteData(
      path: BackendEndpoints.getOrders,
      uId: documentId,
    );

    return const Right(null);
    
  } catch (e) {
   
    return Left(ServerFailure(message: e.toString()));
  }
}

  @override
  Future<Either<Failure, void>> updateProductQuantityIfCancelled({
    required String orderId,
    required List<CheckoutProductDetails> products,
  }) async {
    try {
      // Fetch the order document
      final orderData = await databaseService.getData(
        path: BackendEndpoints.getOrders,
        documentId: orderId,
      );

      if (orderData != null) {
        // Extract the product details list from the order
        final List<dynamic> productList =
            orderData['checkoutProductDetailsList'] ?? [];

        for (final product in productList) {
          final String productCode = product['code'];
          final int cancelledQuantity = product['quantity'] ?? 0;

          // Skip if cancelledQuantity is zero or invalid
          if (cancelledQuantity <= 0) continue;

          // Fetch the product document from the 'products' collection
          final productData = await databaseService.getData(
            path: BackendEndpoints.getProducts,
            documentId: productCode,
          );

          if (productData != null) {
            // Get the current quantity of the product
            final int currentQuantity = productData['productQuantity'] ?? 0;

            // Update the product's quantity by adding the cancelled quantity
            await databaseService.updateData(
              path: BackendEndpoints.getProducts,
              documentId: productCode,
              data: {
                'productQuantity': currentQuantity + cancelledQuantity,
              },
            );
          }
        }
      }

      return const Right(null);
    } catch (e) {
      print('Error updating product quantity: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
