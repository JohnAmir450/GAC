import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_all_products_app_bar.dart';
import 'package:gac/features/user_account/presentation/views/widgets/custom_user_account_view_header.dart';

class UserAccountViewBody extends StatelessWidget {
  const UserAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomApplicationAppBar(title: 'حسابي',showNotificationIcon: false,),
            verticalSpace(24),
            const CustomUserAccountViewHeader(),
            verticalSpace(16),
            Text('عام'),
            ListTile(contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.person_2_outlined, color: AppColors.primaryColor),
                title: const Text('الملف الشخصي'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Navigate to favorites
                },
              ),
              verticalSpace(12),
              ListTile(contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.favorite_border_outlined, color: AppColors.primaryColor),
                title: const Text('المفضلة'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Navigate to favorites
                },
              ),
               verticalSpace(12),
              ListTile(contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.store_mall_directory_outlined, color: AppColors.primaryColor),
                title: const Text('طلباتي'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Navigate to favorites
                },
              ),
              verticalSpace(16),
           const Text('مساعدة'),
            ListTile(contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.error_outline, color: AppColors.primaryColor),
                title: const Text('من نحن'),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  // Navigate to favorites
                },
              ),
              verticalSpace(MediaQuery.sizeOf(context).height*0.1),
              CustomButton(text: 'تسجيل الخروج',onPressed: (){},backgroundColor:Color(0xffEBF9F1) ,textColor: AppColors.primaryColor,),
              verticalSpace(30),
               CustomButton(text: 'حذف الحساب ',onPressed: (){},backgroundColor:Color.fromARGB(255, 244, 204, 204) ,textColor: AppColors.primaryColor,),
          ],
        ),
      ),
    );
  }
}
