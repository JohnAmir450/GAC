import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/generated/l10n.dart';

void showAboutUsDialog(BuildContext context) {
  var locale = S.of(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          locale.about_us,
          style: TextStyles.bold23,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionContent(locale.about_company),
              buildSectionTitle(locale.our_vision),
              buildSectionContent(locale.vision_content),
              buildSectionTitle(locale.our_mission),
              buildSectionContent(locale.mission_content),
              buildSectionTitle(locale.our_values),
              buildSectionContent(locale.values_content),
              buildSectionTitle(locale.what_we_offer),
              buildSectionContent(locale.offer_content),
              buildSectionTitle(locale.our_team),
              buildSectionContent(locale.team_content),
              buildSectionTitle(locale.our_achievements),
              buildSectionContent(locale.achievements_content),
              buildSectionTitle(locale.contact_us),
              buildSectionContent(locale.contact_content),
            ],
          ),
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                locale.close,
                textAlign: TextAlign.start,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// 🛠 Helper functions to build UI sections
Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
    child: Text(
      title,
      style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
    ),
  );
}

Widget buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      content,
      style: TextStyles.semiBold13,
      textAlign: TextAlign.justify,
    ),
  );
}
