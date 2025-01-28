import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/custom_quick_alret_view.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/features/checkout/data/models/order_model.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({
    super.key,
    required this.orderEntity,
  });

  final OrderModel orderEntity;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: orderEntity.orderStatus == 'جاري التأكيد',
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 40), // Set a minimum width & height
              padding: EdgeInsets.symmetric(
                  horizontal: 6.w, vertical: 6.h), // Adjust padding responsively
            ),
            onPressed: () async {
              customQuickAlertView(context,
                  text: 'هل انت متأكد من رغبتك في الغاء الطلب ؟',
                  title: 'الغاء الطلب',
                  confirmBtnText: 'تاكيد',
                  type: QuickAlertType.confirm, onConfirmBtnTap: () {
                context
                    .read<AccountManagerCubit>()
                    .updateProductQuantityIfCancelled(
                        orderId: orderEntity.orderId,
                        products: orderEntity.checkoutProductDetailsList);
                context
                    .read<AccountManagerCubit>()
                    .cancelOrder(context, orderNumber: orderEntity.orderId);
                context.pop();
              });
            },
            child: FittedBox(
                child: Text(
              'الغاء الطلب',
              style: TextStyles.semiBold11,
            ))));
  }
}
