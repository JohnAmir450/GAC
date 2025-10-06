import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/services/notidication_service.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/generated/l10n.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomNotificationWidget extends StatelessWidget {
  const CustomNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is GetNotificationsLoadingState ||
          current is GetNotificationsFailureState ||
          current is GetNotificationsSuccessState,
      builder: (context, state) {
        if (state is GetNotificationsLoadingState) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        if (state is GetNotificationsFailureState) {
          return IconButton(
            icon: const Icon(Icons.error, color: Colors.red),
            onPressed: () {
              context.read<ProductsCubit>().getNotifications();
            },
          );
        }

        if (state is GetNotificationsSuccessState) {
          timeago.setLocaleMessages('ar', timeago.ArMessages());
          final notifications =
              state.notifications; // assuming you have this list
         return PopupMenuButton<String>(
  icon: Stack(
    clipBehavior: Clip.none,
    children: [
      const Icon(Icons.notifications),
      if (notifications.any((n) => !n.isOpened)) 
        Positioned(
          right: -2,
          top: -2,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              "${notifications.where((n) => !n.isOpened).length}", 
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    ],
  ),
  itemBuilder: (context) => notifications.isNotEmpty
      ? notifications.map((n) {
          return PopupMenuItem<String>(
            onTap: () {
              if (!n.isOpened) {
                NotificationService().markNotificationAsOpened(n.oneSignalId);
              }
              context.pushNamed(Routes.userOrdersView);
            },
            child: ListTile(
              leading: n.isOpened
                  ? null
                  : const Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.blue,
                    ),
              title: Text(n.title, style: TextStyles.bold13),
              subtitle: Text(n.body, style: TextStyles.semiBold13),
              trailing: Text(
                timeago.format(n.timestamp.toDate(), locale: 'ar'),
                style: TextStyles.semiBold13,
              ),
              dense: true,
              isThreeLine: true,
            ),
          );
        }).toList()
      : [
          PopupMenuItem<String>(
            child: Text(S.of(context).there_is_no_notifications),
          ),
        ],
);
        }

        // default empty state
        return const Icon(Icons.notifications);
      },
    );
  }
}
