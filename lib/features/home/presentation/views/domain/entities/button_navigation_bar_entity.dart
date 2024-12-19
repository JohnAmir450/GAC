import 'package:gac/core/utils/app_images.dart';

class ButtonNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  ButtonNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<ButtonNavigationBarEntity> buttonNavigationBarEntityList = [
  ButtonNavigationBarEntity(
    name: 'الرئيسية',
    activeImage: Assets.assetsImagesBoldHome,
    inActiveImage:  Assets.assetsImagesHome,
  ),
  ButtonNavigationBarEntity(
    name: 'المنتجات',
    activeImage:  Assets.assetsImagesBoldCategories,
    inActiveImage: Assets.assetsImagesCategories,
  ),
  ButtonNavigationBarEntity(
    name: 'سلة التسوق',
    activeImage: Assets.assetsImagesBoldShoppingCart,
    inActiveImage: Assets.assetsImagesShoppingCart,
  ),
  ButtonNavigationBarEntity(
    name: 'حسابي',
    activeImage: Assets.assetsImagesBoldUser,
    inActiveImage: Assets.assetsImagesUser,
  ),
];
