import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_account_view_body.dart';

class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountManagerCubit(getIt.get<AuthRepo>(),getIt.get<OrdersRepo>()),
      child: const SafeArea(child: UserAccountViewBody()),
    );
  }
}
