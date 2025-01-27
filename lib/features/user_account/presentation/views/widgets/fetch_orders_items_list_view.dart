import 'package:flutter/material.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_orders_item.dart';

class OrdersItemsListView extends StatelessWidget {
  final List<OrderModel> orders;
  final int itemCount;
  const OrdersItemsListView({super.key,required this.orders, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
    
      itemBuilder: (context, index) => UserOrdersItem(orderEntity: orders[index],),
     separatorBuilder: (context, index) => const Divider(endIndent: 16,indent: 16,height: 30,),
      itemCount: itemCount,);
  }
}