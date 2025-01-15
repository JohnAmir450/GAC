import 'package:flutter/material.dart';

void showGovernmentModal({
  required BuildContext context,
  required List<String> options,
  required Function(String) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(options[index]),
          onTap: () {
            onSelected(options[index]);
            Navigator.pop(context); // Close the modal sheet
          },
        );
      },
    ),
  );
}
  final List<String> governorates = [
    "القاهرة",
    "الجيزة",
    "الإسكندرية",
    "الدقهلية",
    "الشرقية",
    "الغربية",
    "سوهاج",
    "أسيوط",
    "المنيا",
    "قنا",
    "الأقصر",
    "أسوان",
  ];