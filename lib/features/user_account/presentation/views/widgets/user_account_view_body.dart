import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/helper_functions/show_about_us_dialog.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_all_products_app_bar.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_account_view_header.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_account_list_tile_item.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_auth_actions_buttons.dart';


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
            const UserAuthActionsButtons(),
          ],
        ),
      ),
    );
  }

 }

