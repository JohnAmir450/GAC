import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/home/presentation/views/widgets/empty_cart_view_widget.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_orders_item.dart';

class UserOrdersViewBody extends StatelessWidget {
  const UserOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountManagerCubit, AccountManagerState>(
      listener: (context, state) {
        if (state is FetchUserOrdersLFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('حدث خطا ما: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        if (state is FetchUserOrdersLoadingState) {
          return const Center(child: CustomAnimatedLoadingWidget());
        } else if (state is FetchUserOrdersSuccessState) {
          final orders = state.orders;
          if (orders.isEmpty) {
            return const EmptyListViewWidget(
                title: 'لا يوجد طلبات',
                subTitle: 'عند الطلب يمكنك متابعة طلباتك من هن');
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            itemCount: orders.length,
            separatorBuilder: (context, index) => const Divider(height: 30),
            itemBuilder: (context, index) {
              final order = orders[index];

              final productDetails = order.checkoutProductDetailsList;

              return UserOrdersItem(
                order: order,
                productDetails: productDetails,
              );
            },
          );
        } else {
          return const Center(child: Text('حدث خطأ'));
        }
      },
    );
  }
}
