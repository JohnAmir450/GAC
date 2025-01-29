import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';

class CustomOrderViewWarning extends StatelessWidget {
  const CustomOrderViewWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      color: AppColors.lightSecondaryColor, 
      child: Row(
        children: [
          const Icon(
            Icons.notifications_active_outlined,
            size: 25, 
          ),
          horizontalSpace(8),
           const Flexible(
            fit : FlexFit.loose,
              child: Text(
            "المنتجات التي تم توصيلها او الغائها سيتم حذفها تلقائيا من صفحة الطلبات خلال 48 ساعة",
            style: TextStyles.regular13,
            maxLines: 2,
            softWrap: true, 
            overflow: TextOverflow.ellipsis, 
          )),
        ],
      ),
    );
  }
}
