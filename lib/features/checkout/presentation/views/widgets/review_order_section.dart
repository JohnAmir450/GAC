import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/checkout/presentation/views/widgets/order_summary_widget.dart';

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
             const Text(
              'طريقة الدفع',
              style: TextStyles.bold16,
            ),
            verticalSpace(6),
            const Text(
              'الدفع عند الاستلام',
            ),
            verticalSpace(16),
            const Divider(),
            verticalSpace(8),
             Text(
              'عنوان التوصيل',
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
                Spacer(),
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
                        'تعديل',
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
