import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/features/product_types/manager/product_types/product_types_cubit.dart';
import 'package:gac/generated/l10n.dart';

import 'widgets/product_types_view_body.dart';

class ProductTypesView extends StatelessWidget {
  final String productType;
  const ProductTypesView({super.key, required this.productType});

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);

    // Convert productType to localized string
    final localizedProductType = _getLocalizedProductType(localizations, productType);

    return BlocProvider(
      create: (context) => ProductTypesCubit(getIt.get<ProductsRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: localizations.shopInsideProducts(localizedProductType), // Localized title
          onTap: () => context.pop(),
        ),
        body: ProductTypesViewBody(
          productType: productType,
        ),
      ),
    );
  }

  // Function to get localized product type names
  String _getLocalizedProductType(S localizations, String productType) {
    switch (productType) {
      case 'سمن':
        return localizations.ghee;
      case 'زيوت':
        return localizations.oils;
      case 'صناعي':
        return localizations.industrial;
      default:
        return productType; // Fallback
    }
  }
}
