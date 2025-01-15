import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/checkout/domain/entities/checkout_product_details.dart';
import 'package:gac/features/user_account/presentation/views/widgets/expanded_product_details_widget.dart';
import 'package:gac/features/user_account/presentation/views/widgets/main_order_details_widget.dart';

class UserOrdersItem extends StatefulWidget {
  const UserOrdersItem({
    super.key,
    required this.order,
    required this.productDetails,
  });

  final OrderModel order;
  final List<CheckoutProductDetails> productDetails;

  @override
  State<UserOrdersItem> createState() => _UserOrdersItemState();
}

class _UserOrdersItemState extends State<UserOrdersItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth >
            600; // Detect wide screen (tablet or large phone)

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesMyOrderIcon),
                horizontalSpace(16),
                MainOrderDetailsWidget(widget: widget, isWideScreen: isWideScreen),
                const Spacer(),
                 IconButton(
                  icon: Transform.rotate(
                    angle: isExpanded
                        ? 3.14*3/2
                        :3.14/2 , 
                    child: const Icon(Icons.arrow_back_ios,),
                  ),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                )
              ],
            ),
            ExpandedProductDetailsWidget(
                isExpanded: isExpanded,
                isWideScreen: isWideScreen,
                widget: widget),
            verticalSpace(16),
          ],
        );
      },
    );
  }
}

