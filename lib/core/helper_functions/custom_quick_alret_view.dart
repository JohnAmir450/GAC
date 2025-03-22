import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/generated/l10n.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void customQuickAlertView(
  BuildContext context, {
  required String text,
  required String title,
  required String confirmBtnText,
  required QuickAlertType type,
  required void Function()? onConfirmBtnTap,
  String? cancelBtnText,
}) {
  QuickAlert.show(
    context: context,
    type: type,
    title: title,
    text: text,
    confirmBtnText: confirmBtnText,
    onConfirmBtnTap: onConfirmBtnTap,
    cancelBtnText:  cancelBtnText ?? S.of(context).no,
    confirmBtnColor: AppColors.secondaryColor,
  );
}
