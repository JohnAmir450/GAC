import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/utils/app_images.dart';

class OnBoardingBackGround extends StatelessWidget {
  const OnBoardingBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        left: 0,
        
        
        child: SvgPicture.asset(
          Assets.assetsImagesPageViewItem1BackgroundImage,
          fit: BoxFit.fill,
        ));
  }
}