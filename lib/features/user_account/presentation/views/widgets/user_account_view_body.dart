import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/helper_functions/show_about_us_dialog.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_all_products_app_bar.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_account_view_header.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UserAccountViewBody extends StatelessWidget {
  const UserAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomApplicationAppBar(
              title: 'حسابي',
              showNotificationIcon: false,
            ),
            verticalSpace(24),
            const CustomUserAccountViewHeader(),
            verticalSpace(16),
            const Text('عام'),
            UserAccountListTileItem(
              text: 'الملف الشخصي',
              icon: Icons.person_outlined,
              onTap: () {
                context.pushNamed(Routes.userProfileView);
              },
            ),
            verticalSpace(12),
            UserAccountListTileItem(
              text: 'معلومات التوصيل',
              icon: Icons.local_shipping_outlined,
              onTap: () {
                context.pushNamed(Routes.updateUserShippingInformationView);
              },
            ),
            verticalSpace(12),
            UserAccountListTileItem(
                text: 'طلباتي',
                icon: Icons.shopping_bag_outlined,
                onTap: () {
                  context.pushNamed(Routes.userOrdersView);
                }),
            verticalSpace(16),
            const Text('مساعدة'),
            GestureDetector(
            onTap: (){
              showAboutUsDialog( context);
            },  
            
              child: const UserAccountListTileItem(
                  text: 'من نحن', icon: Icons.error_outline),
            ),
            verticalSpace(MediaQuery.sizeOf(context).height * 0.1),
            CustomButton(
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
                    context.pushNamed(Routes.loginView);
                  },
                );
              },
              backgroundColor: const Color(0xffEBF9F1),
              textColor: AppColors.primaryColor,
            ),
            verticalSpace(30),
            CustomButton(
              text: 'حذف الحساب ',
              onPressed: () {
                customQuickAlertView(
                  context,
                  text: 'هل انت متاكد من حذف الحساب ؟\n سيتم حذف جميع بياناتك',
                  title: 'حذف الحساب',
                  type: QuickAlertType.warning,
                  confirmBtnText: 'حذف',
                  onConfirmBtnTap: () {
                    context.read<AccountManagerCubit>().deleteAccount(uId: getUserData().uId);
                    context.pushNamed(Routes.onBoardingView);
                  },
                );
              },
              backgroundColor: const Color.fromARGB(255, 244, 204, 204),
              textColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  void customQuickAlertView(BuildContext context,
      {required String text,
      required String title,
      required String confirmBtnText,
      required QuickAlertType type,
      required void Function()? onConfirmBtnTap}) {
    QuickAlert.show(
      context: context,
      type: type,
      title: title,
      text: text,
      confirmBtnText: confirmBtnText,
      onConfirmBtnTap: onConfirmBtnTap,
      cancelBtnText: 'لا',
      confirmBtnColor: AppColors.secondaryColor,
    );
  }
}

class UserAccountListTileItem extends StatelessWidget {
  const UserAccountListTileItem({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
