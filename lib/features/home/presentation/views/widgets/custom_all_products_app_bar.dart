import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/widgets/custom_notification_icon.dart';

class CustomApplicationAppBar extends StatelessWidget {
  const CustomApplicationAppBar({
    super.key, required this.title, this.showNotificationIcon=true
  });
  final String title;
  final bool? showNotificationIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title,style: TextStyles.bold19,textAlign: TextAlign.center,)),
        const Visibility(
          visible: false,
          child:  CustomNotificationIcon())
      ],
    );
  }
}
