import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/services/notidication_service.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/core/widgets/custom_button.dart';

class OrderConfirmedSuccessfully extends StatelessWidget {
  final String orderId;
  const OrderConfirmedSuccessfully({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الدفع', visibleLeading: false),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0, horizontal: 16),
            child: Column(
              children: [
                SvgPicture.asset(Assets.assetsImagesOrderConfirmedSuccessfully),
                verticalSpace(16),
                const Text(
                  'تم تاكيد الطلب بنجاح',
                  style: TextStyles.bold16,
                ),
                verticalSpace(8),
                Text(
                  ' رقم الطلب : $orderId# ',
                  style: TextStyles.semiBold16.copyWith(color: const Color(0xff4E5556)),
                ),
                verticalSpace(MediaQuery.sizeOf(context).height * 0.15),
                CustomButton(
                  text: 'رجوع للصفحة الرئيسية',
                  onPressed: () async {
                    context.pushReplacementNamed(Routes.mainView);
                    await NotificationService().sendNotification();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
