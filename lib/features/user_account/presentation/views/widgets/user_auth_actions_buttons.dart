import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/custom_quick_alret_view.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';

class UserAuthActionsButtons extends StatelessWidget {
  const UserAuthActionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          height: isDeviceInPortrait(context) ? 54.h : 100.h,
          text: 'تسجيل الخروج',
          onPressed: () {
            customQuickAlertView(
              context,
              text: 'هل انت متاكد من تسجيل الخروج ؟',
              title: 'تسجيل الخروج',
              type: QuickAlertType.confirm,
              confirmBtnText: 'خروج',
              onConfirmBtnTap: () {
                context.read<AccountManagerCubit>().signOut();

                context.pushNamedAndRemoveUntil(
                  Routes.loginView,
                  predicate: (Route<dynamic> route) => false,
                );
              },
            );
          },
          backgroundColor: const Color(0xffEBF9F1),
          textColor: AppColors.primaryColor,
        ),
        verticalSpace(30),
        CustomButton(
          height: isDeviceInPortrait(context) ? 54.h : 100.h,
          text: 'حذف الحساب ',
          onPressed: () {
            customQuickAlertView(
              context,
              text: 'هل انت متاكد من حذف الحساب ؟\n سيتم حذف جميع بياناتك',
              title: 'حذف الحساب',
              type: QuickAlertType.warning,
              confirmBtnText: 'حذف',
              onConfirmBtnTap: () {
                context
                    .read<AccountManagerCubit>()
                    .deleteAccount(uId: getUserData().uId);

                context.pushNamedAndRemoveUntil(
                  Routes.onBoardingView,
                  predicate: (Route<dynamic> route) => false,
                );
              },
            );
          },
          backgroundColor: const Color.fromARGB(255, 244, 204, 204),
          textColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
