import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveNavigationItem extends StatelessWidget {
  const InActiveNavigationItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}