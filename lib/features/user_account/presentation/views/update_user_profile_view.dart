import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/repos/orders_repo/orders_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/update_user_profile_view_body.dart';

class UpdateUserProfileView extends StatelessWidget {
  const UpdateUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الملف الشخصي',
        onTap: () => context.pop(),
      ),
      body: BlocProvider(
        create: (context) =>
            AccountManagerCubit(getIt.get<AuthRepo>(), getIt.get<OrdersRepo>()),
        child: BlocListener<AccountManagerCubit, AccountManagerState>(
          listener: (context, state) {
            if (state is AccountManagerUpdateUserDataSuccessState) {
              showSnackBar(context,
                  text: 'تم التعديل البيانات بنجاح',
                  color: AppColors.primaryColor);
            }
          },
          child: const UpdateUserProfileViewBody(),
        ),
      ),
    );
  }
}
