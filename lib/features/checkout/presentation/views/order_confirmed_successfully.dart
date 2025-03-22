import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/services/notidication_service.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/generated/l10n.dart';

class OrderConfirmedSuccessfully extends StatelessWidget {
  final String orderId;
  const OrderConfirmedSuccessfully({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    var locale=S.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 140.0.h, horizontal: 16),
            child: Column(
              children: [
                SvgPicture.asset(Assets.assetsImagesOrderConfirmedSuccessfully),
                verticalSpace(16),
                  Text(
                 locale.order_confirmed_successfully,
                  style: TextStyles.bold16,
                ),
                verticalSpace(8),
                Text(
                  locale.order_number(orderId),
                  style: TextStyles.semiBold16.copyWith(color: const Color(0xff4E5556)),
                ),
                verticalSpace(MediaQuery.sizeOf(context).height * 0.15),
                CustomButton(width: MediaQuery.sizeOf(context).width*0.6,
                  text: locale.return_to_home,
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
