// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gac/core/helper_functions/extentions.dart';
// import 'package:gac/core/helper_functions/foramted_date.dart';
// import 'package:gac/core/utils/app_colors.dart';
// import 'package:gac/core/utils/app_text_styles.dart';
// import 'package:gac/core/utils/spacing.dart';
// import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
// import 'package:gac/features/user_account/presentation/views/widgets/custom_text_reach.dart';
// import 'package:gac/features/user_account/presentation/views/widgets/custom_user_orders_item.dart';
// import 'package:quickalert/models/quickalert_type.dart';
// import 'package:quickalert/widgets/quickalert_dialog.dart';

// class MainOrderDetailsWidget extends StatelessWidget {
//   const MainOrderDetailsWidget({
//     super.key,
//     required this.widget,
//     required this.isWideScreen,
//   });

//   final UserOrdersItem widget;
//   final bool isWideScreen;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'رقم الطلب : ${widget.orderEntity.orderId}#',
//           style: TextStyles.bold16.copyWith(fontSize: isWideScreen ? 18 : 16),
//         ),
//         verticalSpace(8),
//         Text(
//           'قيمة الطلب : ${widget.orderEntity.totalPrice} جنيه',
//           style: TextStyles.bold13.copyWith(fontSize: isWideScreen ? 15 : 13),
//         ),
//         verticalSpace(8),
//         Text(
//           'تم الطلب يوم : ${formatOrderDateFromTimestamp(widget.orderEntity.orderDate)}',
//           style:
//               TextStyles.semiBold16.copyWith(fontSize: isWideScreen ? 16 : 14),
//         ),
//         verticalSpace(8),
//         CustomTextRich(
//           textLabel: 'حالة الطلب : ',
//           textValue: widget.orderEntity.orderStatus,
//           textStyle: TextStyles.bold16.copyWith(
//             color: AppColors.primaryColor,
//             fontSize: isWideScreen ? 18 : 16,
//           ),
//         ),
//         verticalSpace(12),
//         Visibility(
//             visible: widget.orderEntity.orderStatus == 'جاري التأكيد',
//             child: ElevatedButton(
//                 onPressed: () async {
//                   QuickAlert.show(
//                       context: context,
//                       type: QuickAlertType.info,
//                        confirmBtnText: 'تاكيد',
//                       cancelBtnText: 'الغاء',
//                       showCancelBtn: true,
                     
//                       title: 'هل انت متأكد من رغبتك في الغاء الطلب ؟',
//                       onConfirmBtnTap: () async {
                        
//                          context.read<AccountManagerCubit>().cancelOrder(
//                             context,
//                             orderNumber: widget.orderEntity.orderId);
//                         context.pop();
//                       },
//                       onCancelBtnTap: () {
//                         context.pop();
//                       });
//                 },
//                 child: Text('الغاء الطلب')))
//       ],
//     );
//   }
// }
