import 'package:gac/core/entities/products_entity.dart';

ProductEntity getDummyProduct() => ProductEntity(
  name: 'product name',
  price: 10,
  description: 'product description',
  code: 'product code', 
  isFeatured: true,
  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/gac-project-b507f.appspot.com/o/images%2FWhatsApp%20Image%202024-09-13%20at%2007.12.27_702b4091.jpg..jpg?alt=media&token=e84f9282-3654-4bcc-a14c-7de17ec8f0b1',      
  expirationMonths: 10,
  isOrganic: true,
  productQuantity: 10,
  numberOfCalories: 10,
  reviews: [],
);

List<ProductEntity> getDummyProducts() => List.generate(5, (index) => getDummyProduct());