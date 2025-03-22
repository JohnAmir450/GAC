import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/generated/l10n.dart';

void showTermsAndConditionsDialog(BuildContext context) {
  var locale = S.of(context);
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          locale.terms_conditions,
          style: TextStyles.bold23,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle(locale.acceptance_of_terms),
              buildSectionContent(locale.acceptance_of_terms_content),
              buildSectionTitle(locale.company_information),
              buildSectionContent(locale.company_information_content),
              buildSectionTitle(locale.user_registration),
              buildSectionContent(locale.user_registration_content),
              buildSectionTitle(locale.points_collection_usage),
              buildSectionContent(locale.points_collection_usage_content),
              buildSectionTitle(locale.data_collection_usage),
              buildSectionContent(locale.data_collection_usage_content),
              buildSectionTitle(locale.app_usage),
              buildSectionContent(locale.app_usage_content),
              buildSectionTitle(locale.cash_on_delivery_term),
              buildSectionContent(locale.cash_on_delivery_content),
              buildSectionTitle(locale.data_update),
              buildSectionContent(locale.data_update_content),
              buildSectionTitle(locale.order_cancellation),
              buildSectionContent(locale.order_cancellation_content),
              buildSectionTitle(locale.intellectual_property_rights),
              buildSectionContent(locale.intellectual_property_rights_content),
              buildSectionTitle(locale.liability_limitations),
              buildSectionContent(locale.liability_limitations_content),
              buildSectionTitle(locale.terms_modifications),
              buildSectionContent(locale.terms_modifications_content),
              buildSectionTitle(locale.applicable_laws),
              buildSectionContent(locale.applicable_laws_content),
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
                locale.agree,
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

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
    child: Text(
      title,
      style: TextStyles.bold16,
    ),
  );
}

Widget buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      content,
      style: TextStyles.regular14,
    ),
  );
}