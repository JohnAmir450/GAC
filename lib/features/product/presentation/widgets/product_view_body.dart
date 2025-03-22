import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/models/product_detailed_model.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/features/product/presentation/widgets/get_all_product_weights.dart';
import 'package:gac/features/product/presentation/widgets/listenable_add_to_cart_button.dart';
import 'package:gac/features/product/presentation/widgets/product_view_item_details.dart';
import 'package:gac/generated/l10n.dart';

class ProductViewBody extends StatefulWidget {
  final ProductEntity productEntity;
  const ProductViewBody({super.key, required this.productEntity});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  final ValueNotifier<bool> _isVisible = ValueNotifier(true);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse && _isVisible.value) {
      _isVisible.value = false;
    } else if ((direction == ScrollDirection.forward ||
            direction == ScrollDirection.idle) &&
        !_isVisible.value) {
      _isVisible.value = true;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    var locale=S.of(context);
    List<ProductDetailedModel> details = [
      ProductDetailedModel(
        title: widget.productEntity.expirationMonths == 12
            ? locale.year
            : '${widget.productEntity.expirationMonths} ${locale.month}',
        subtitle:locale.expiry,
        trailing: SvgPicture.asset(Assets.assetsImagesCalendar),
      ),
      ProductDetailedModel(
        title: '100%',
        subtitle: locale.organic,
        trailing: SvgPicture.asset(Assets.assetsImagesOrganicPicture),
      ),
    ];

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          showSnackBar(context,
              text:  S.of(context).product_added_success,
              color: AppColors.lightPrimaryColor);
        } else if (state is AddToCartFailureState) {
          showSnackBar(
            context,
            text: state.errorMessage,
          );
        }
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductViewItemDetails(
                  productEntity: widget.productEntity,
                  cartCubit: cartCubit,
                  details: details,
                ),
                GetAllProductWeights(
                  productEntity: widget.productEntity,
                ),
                verticalSpace(80),
              ],
            ),
          ),
          ListenableAddToCartButton(isVisible: _isVisible, widget: widget),
        ],
      ),
    );
  }
}
