import 'package:dartz/dartz.dart';
import 'package:gac/core/errors/failures.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo{
  Future<Either<Failure,void>> addOrder({required OrderEntity orderEntity});
  Future<Either<Failure,void>>emptyCart({required String userId});
   Future<Either<Failure, void>> updatePhoneNumber({
    required String uId,
    required String phoneNumber,
  });
    Future<void> updateProductStock({required String productCode, required int quantitySold});
   
} 