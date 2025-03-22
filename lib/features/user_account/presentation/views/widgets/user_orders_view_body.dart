import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/home/presentation/views/widgets/empty_cart_view_widget.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_order_view_warning.dart';
import 'package:gac/features/user_account/presentation/views/widgets/fetch_orders_items_list_view.dart';
import 'package:gac/features/user_account/presentation/views/widgets/filter_section.dart';
import 'package:gac/generated/l10n.dart';

class UserOrdersViewBody extends StatelessWidget {
  const UserOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var locale= S.of(context);
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
            child:  CustomOrderViewWarning()),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: FilterSection(),
          ),
        ),
        BlocBuilder<AccountManagerCubit, AccountManagerState>(
            builder: (context, state) {
          if (state is FetchUserOrdersSuccessState) {
            if (state.orders.isEmpty) {
              return  SliverToBoxAdapter(
                child:  EmptyListViewWidget(
                    title:locale.no_orders,
                    subTitle: locale.no_orders_subtitle),
              );
            }
            return OrdersItemsListView(
              orders: state.orders,
              itemCount: state.orders.length,
            );
          } else if (state is FetchUserOrdersLFailureState) {
            return SliverToBoxAdapter(child: Text(state.errorMessage));
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CustomAnimatedLoadingWidget(),
              ),
            );
          }
        }),
      ],
    );
  }
}

