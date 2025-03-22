import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_orders_view_body.dart';
import 'package:gac/generated/l10n.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title:S.of(context).my_orders,
        onTap: () => context.pop(),
      ),
      body: BlocProvider(
        create: (context) =>
            AccountManagerCubit(getIt.get<AuthRepo>(), getIt.get<OrdersRepo>())
              ..fetchUserOrders(query: {
                'orderBy': 'orderDate',
                'descending': true,
              }),
        child: const UserOrdersViewBody(),
      ),
    );
  }
}
