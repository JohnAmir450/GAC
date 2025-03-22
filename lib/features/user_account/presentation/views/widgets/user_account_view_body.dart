import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/helper_functions/show_about_us_dialog.dart';
import 'package:gac/core/helper_functions/terms_and_conditions_widget_view.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_all_products_app_bar.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_account_view_header.dart';
import 'package:gac/features/user_account/presentation/views/widgets/language_switcher_tile.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_account_list_tile_item.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_auth_actions_buttons.dart';
import 'package:gac/generated/l10n.dart';

class UserAccountViewBody extends StatelessWidget {
  final VoidCallback navigateToHomeScreen;
  const UserAccountViewBody({super.key, required this.navigateToHomeScreen});

  @override
  Widget build(BuildContext context) {
    var locale=S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CustomApplicationAppBar(
              title:locale.my_account,
              showNotificationIcon: false,
            ),
            verticalSpace(24),
            const CustomUserAccountViewHeader(),
            verticalSpace(16),
           
            UserAccountListTileItem(
              text: locale.profile,
              icon: Icons.person_outlined,
              onTap: () {
                context.pushNamed(Routes.userProfileView);
              },
            ),
            verticalSpace(12),
            UserAccountListTileItem(
              text: locale.shipping_info,
              icon: Icons.local_shipping_outlined,
              onTap: () {
                context.pushNamed(Routes.updateUserShippingInformationView);
              },
            ),
            verticalSpace(12),
            UserAccountListTileItem(
              text: locale.my_orders,
              icon: Icons.shopping_bag_outlined,
              onTap: () {
                context.pushNamed(Routes.userOrdersView);
              },
            ),
            verticalSpace(16),
            LanguageSwitcherTile(navigateToHomeScreen:  navigateToHomeScreen ,),

            verticalSpace(12),
             Text(locale.help),
            GestureDetector(
              onTap: () {
                showAboutUsDialog(context);
              },
              child:  UserAccountListTileItem(text: locale.about_us, icon: Icons.error_outline),
            ),
            verticalSpace(16),
            GestureDetector(
              onTap: () => showTermsAndConditionsDialog(context),
              child:  UserAccountListTileItem(text:locale.terms_conditions, icon: Icons.policy_outlined),
            ),
            verticalSpace(MediaQuery.sizeOf(context).height * 0.1),
            const UserAuthActionsButtons(),
          ],
        ),
      ),
    );
  }
}



