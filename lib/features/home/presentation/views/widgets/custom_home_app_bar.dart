import 'package:flutter/material.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/generated/l10n.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
          
          title:  Text( S.of(context).welcome,style: TextStyles.regular16.copyWith(color: const Color(0xff949D9E),),
          ),
          subtitle:  Text(getUserData().name,style: TextStyles.bold16),
          
          );
  }
}