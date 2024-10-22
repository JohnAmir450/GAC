
class FeaturedItemsEntity {
  final String title;

  final String subTitle;

  FeaturedItemsEntity({required this.title, required this.subTitle});
}

List<FeaturedItemsEntity> featuredItemsEntityList = [
  FeaturedItemsEntity(
    title: 'الشركة العربية الخليجية',
    subTitle: 'احصل على افضل الاسعار مباشرة عبر تطبيق',
  ),
  FeaturedItemsEntity(
    subTitle: '',
    title: 'متابعة كاملة لأخر تغيرات الاسعار ',
  ),
];
