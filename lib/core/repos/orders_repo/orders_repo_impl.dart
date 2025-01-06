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

 
  
}
