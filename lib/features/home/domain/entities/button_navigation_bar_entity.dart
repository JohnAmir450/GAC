import 'package:flutter/material.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/generated/l10n.dart';

class ButtonNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String Function(BuildContext) name; // Change to function returning a localized string

  ButtonNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<ButtonNavigationBarEntity> buttonNavigationBarEntityList = [
  ButtonNavigationBarEntity(
    name: (context) => S.of(context).home, // Use localized text
    activeImage: Assets.assetsImagesBoldHome,
    inActiveImage: Assets.assetsImagesHome,
  ),
  ButtonNavigationBarEntity(
    name: (context) => S.of(context).products,
    activeImage: Assets.assetsImagesBoldCategories,
    inActiveImage: Assets.assetsImagesCategories,
  ),
  ButtonNavigationBarEntity(
    name: (context) => S.of(context).cart,
    activeImage: Assets.assetsImagesBoldShoppingCart,
    inActiveImage: Assets.assetsImagesShoppingCart,
  ),
  ButtonNavigationBarEntity(
    name: (context) => S.of(context).profile,
    activeImage: Assets.assetsImagesBoldUser,
    inActiveImage: Assets.assetsImagesUser,
  ),
];
