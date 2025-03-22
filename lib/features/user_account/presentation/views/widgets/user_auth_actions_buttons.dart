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
import 'package:gac/generated/l10n.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UserAuthActionsButtons extends StatelessWidget {
  const UserAuthActionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var locale = S.of(context);

    return Column(
      children: [
        CustomButton(
          height: isDeviceInPortrait(context) ? 54.h : 100.h,
          text: locale.logout,
          onPressed: () {
            customQuickAlertView(
              context,
              text: locale.logout_confirmation,
              title: locale.logout,
              type: QuickAlertType.confirm,
              confirmBtnText: locale.logout,
              cancelBtnText: locale.cancel,
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
          text: locale.delete_account,
          onPressed: () async {
            final accountCubit = context.read<AccountManagerCubit>();

            final user = await accountCubit.getCurrentUser();

            final bool isEmailUser =
                user.providerData.first.providerId == 'password';

            if (isEmailUser) {
              _showPasswordQuickAlert(context, accountCubit);
            } else {
              _confirmDeleteAccount(context, accountCubit, null);
            }
          },
          backgroundColor: const Color.fromARGB(255, 244, 204, 204),
          textColor: AppColors.primaryColor,
        ),
      ],
    );
  }

  void _showPasswordQuickAlert(
      BuildContext context, AccountManagerCubit cubit) {
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var locale = S.of(context);

    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      title: locale.delete_button_title,
      confirmBtnText: locale.password_verification_text,
      cancelBtnText: locale.cancel,
      showCancelBtn: true,
      barrierDismissible: false,
      widget: Form(
        key: formKey,
        child: TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: locale.password_hint,
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return locale.password_hint;
            }
            return null;
          },
        ),
      ),
      onConfirmBtnTap: () async {
        if (formKey.currentState!.validate()) {
          context.pop();

          QuickAlert.show(
            context: context,
            type: QuickAlertType.loading,
            title: locale.password_verification_processing,
            barrierDismissible: false,
          );

          bool isAuthenticated =
              await cubit.reauthenticateUser(passwordController.text);

          context.pop();

          if (isAuthenticated) {
            _confirmDeleteAccount(context, cubit, passwordController.text);
          } else {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: locale.error_dialog_title,
                text: locale.password_is_incorrect,
                confirmBtnText: locale.ok,
                cancelBtnText: locale.forget_password,
                showCancelBtn: true,
                onCancelBtnTap: () {
                  context.pushNamed(Routes.resetPasswordView);
                });
          }
        }
      },
    );
  }

  void _confirmDeleteAccount(
      BuildContext context, AccountManagerCubit cubit, String? password) {
    var locale = S.of(context);

    customQuickAlertView(
      context,
      text: locale.delete_confirmation,
      title: locale.delete_account,
      type: QuickAlertType.warning,
      confirmBtnText: locale.delete,
      onConfirmBtnTap: () async {
        await cubit.deleteAccount(uId: getUserData().uId, password: password);
        context.pushNamedAndRemoveUntil(
          Routes.onBoardingView,
          predicate: (Route<dynamic> route) => false,
        );
      },
    );
  }
}
