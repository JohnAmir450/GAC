import 'package:flutter/material.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/get_aspect_ration.dart';
import 'package:gac/features/product/presentation/widgets/get_all_product_weights_bloc_builder.dart';

class GetAllProductWeights extends StatelessWidget {
  final ProductEntity productEntity;

  const GetAllProductWeights({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double itemHeight = (screenHeight / getProductHeight(context));
    return GetAllProductsWeightBlocBuilder(
        productEntity: productEntity, itemHeight: itemHeight);
  }
}

