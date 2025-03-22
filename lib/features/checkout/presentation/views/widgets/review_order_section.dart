import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/order_summary_widget.dart';
import 'package:gac/generated/l10n.dart';

class ReviewOrderSection extends StatelessWidget {
  const ReviewOrderSection({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ), //EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderSummaryWidget(),
            verticalSpace(24),
            const Divider(),
            verticalSpace(8),
               Text(
              S.of(context).payment_method,
              style: TextStyles.bold16,
            ),
            verticalSpace(6),
             Text(
               S.of(context).cash_on_delivery,
            ),
            verticalSpace(16),
            const Divider(),
            verticalSpace(8),
               Text(
               S.of(context).address,
              style: TextStyles.bold16,
            ),
            verticalSpace(6),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.grey.shade600),
                Flexible(
                    child: Text(
                  '${context.read<OrderEntity>().shippingAddressEntity}',
                  style: TextStyles.semiBold13
                      .copyWith(color: Colors.grey.shade600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                        pageController.page!.toInt() - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit_location_outlined,
                          color: Colors.grey.shade600),
                      Text(
                         S.of(context).edit,
                        style: TextStyles.semiBold13
                            .copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
