import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomAnimatedLoadingWidget extends StatelessWidget {
  final double? size;
  const CustomAnimatedLoadingWidget({
    super.key,this.size
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingAnimationWidget.inkDrop(
          color: AppColors.secondaryColor, size:size?? 32));
  }
}