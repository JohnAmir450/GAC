import 'package:gac/core/utils/app_images.dart';

class FeaturedItemsEntity {
  final String image;

  final String productType;

  FeaturedItemsEntity({required this.image, required this.productType});
}

List<FeaturedItemsEntity> featuredItemsEntityList = [
  FeaturedItemsEntity(
    image: Assets.assetsImagesGheeFeaturedImage,
    productType: 'سمن',
  ),
  FeaturedItemsEntity(
    image: Assets.assetsImagesOilsDepartmentFeaturedImage,
    productType: 'زيوت',
  ),
  FeaturedItemsEntity(
    image: Assets.assetsImagesIndustrialDepartmentFeaturedImage,
    productType: 'صناعي',
  ),
];
