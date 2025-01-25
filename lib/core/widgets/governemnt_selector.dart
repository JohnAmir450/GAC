import 'package:flutter/material.dart';

void showGovernmentModal({
  required BuildContext context,
  required List<String> options,
  required Function(String) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => ListView.separated(
      separatorBuilder: (context, index) => const Divider(indent: 20,endIndent: 20,),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Center(child: Text(options[index])),
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
    "غرب القاهرة",
    "وسط وشرق القاهرة",
    "الجيزة",
    "جنوب وغرب الجيزة",
    "الإسكندرية",
    "الدقهلية",
    "الشرقية",
    "الغربية",
    "الفيوم",
    "كفر الشيخ",
    "بني سويف",
    "المنوفية",
    "البحيرة",
    "القليوبية",
    " دمياط",
    "بورسعيد",
    "سوهاج",
    "أسيوط",
    "المنيا",
    "قنا",
    "الأقصر",
    "أسوان",
  ];