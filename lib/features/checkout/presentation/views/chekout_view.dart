import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/analytics_service.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/domain/entities/shiping_address_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:gac/features/home/manager/add_order/orders_cubit.dart';
import 'package:gac/features/home/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({
    super.key,
    required this.cartItems,
    required this.totalPrice,
  });
  final List<CartEntity> cartItems;

  final double totalPrice;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    AnalyticsService.logScreenView(screenName: 'CheckoutView');
    Random random = Random();
    int randomOrderIdNumber = random.nextInt(111111) + 11111111;
   final DateTime now = DateTime.now();
final Timestamp timestamp = Timestamp.fromDate(now);
    super.initState();
    orderEntity = OrderEntity(
      payWithCash: true,
      orderStatus: 'جاري التأكيد',
      orderId: randomOrderIdNumber.toString(),
      orderDate: timestamp,
      uID: getUserData().uId,
      cartItems: widget.cartItems,
      totalPrice: widget.totalPrice,
      shippingAddressEntity: ShippingAddressEntity(
        customerGovernment: getShippingAddress()?.customerGovernment??' ',
        customerCity: getShippingAddress()?.customerCity??' ',
        customerStreetName: getShippingAddress()?.customerStreetName??' ',
          customerLocationDescription: getShippingAddress()?.customerLocationDescription??' ',
        customerName: '${getUserData().name} ${getUserData().secondName}',
        customerEmail: getUserData().email,
        customerPhone: getUserData().phoneNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt.get<OrdersRepo>())..getDiscountSettings(),
      child: Scaffold(
       
        body: SafeArea(
          child: Provider.value(
              value: orderEntity,
              child: const AddOrderCubitBlocBuilder(child: CheckoutViewBody())),
        ),
      ),
    );
  }
}
