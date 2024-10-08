import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/utils/app_text_styles.dart';

class LoginMethodItem extends StatelessWidget {
  const LoginMethodItem({
    super.key, required this.image, required this.text,
  });
final String image,text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
      width: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(
            0xffDDDFDF,
          ),
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      )),
      child: Row(
        children: [
          SvgPicture.asset(image),
          Spacer(),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
          Spacer() //Text('تسجيل الدخول بواسطة جوجل',textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
