import 'package:dartz/dartz.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/database_service.dart';
import 'package:gac/core/utils/backend_endpoints.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity}) async{
    try {
      await databaseService.addData(
          path: BackendEndpoints.addOrders,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> emptyCart({required String userId}) async{
    try{
          await databaseService.emptyCart(userId: userId);
    return const Right(null);
    }
    catch(e){
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
 
  Future<void> updateProductStock({required String productCode, required int quantitySold}) async {
  // Fetch the current stock of the product
  var productData = await databaseService.getData(path: BackendEndpoints.getProducts, documentId: productCode);

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

}
