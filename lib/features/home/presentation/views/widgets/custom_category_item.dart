import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductCategoryItem extends StatelessWidget {
  const CustomProductCategoryItem({
    super.key,
    required this.categoryImage, required this.categoryName,
  });
  final String categoryImage;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(7, 2), // changes position of shadow
            ),
          ],
          color: const Color(0xffF3F5F9),
          borderRadius: BorderRadius.circular(16.r)),
      child: Center(
        child: Image.asset(categoryImage,fit: BoxFit.fitHeight,),
      ),
    );
  }
}
