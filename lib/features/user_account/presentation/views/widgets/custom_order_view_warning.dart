import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/generated/l10n.dart';

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
           Flexible(
            fit : FlexFit.loose,
              child: Text(
           S.of(context).delivered_or_canceled_orders_auto_delete,
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
