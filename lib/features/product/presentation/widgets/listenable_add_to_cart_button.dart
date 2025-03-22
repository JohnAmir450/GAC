import 'package:flutter/material.dart';
import 'package:gac/features/product/presentation/widgets/add_to_cart_button_section.dart';
import 'package:gac/features/product/presentation/widgets/product_view_body.dart';

class ListenableAddToCartButton extends StatelessWidget {
  const ListenableAddToCartButton({
    super.key,
    required ValueNotifier<bool> isVisible,
    required this.widget,
  }) : _isVisible = isVisible;

  final ValueNotifier<bool> _isVisible;
  final ProductViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isVisible,
        builder: (context, isVisible, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isVisible ? 1 : 0,
            child: isVisible ? child! : const SizedBox.shrink(),
          );
        },
        child:
            AddToCartButtonSection(productEntity: widget.productEntity),
      ),
    );
  }
}
