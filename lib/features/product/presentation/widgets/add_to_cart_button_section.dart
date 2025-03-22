import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/products_entity.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/models/cart_model.dart';
import 'package:gac/core/models/product_model.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/generated/l10n.dart';

class AddToCartButtonSection extends StatefulWidget {
  const AddToCartButtonSection({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<AddToCartButtonSection> createState() => _AddToCartButtonSectionState();
}

class _AddToCartButtonSectionState extends State<AddToCartButtonSection> {
  int cartQuantity = 1;
  final TextEditingController _controller = TextEditingController(text: '1');

  void _updateQuantity(String value) {
    setState(() {
      int? parsedValue = int.parse(value);
      cartQuantity = (parsedValue > 0) ? parsedValue : 1;
      _controller.text = cartQuantity.toString(); // Ensure valid input
    });
  }

  @override

  Widget build(BuildContext context) {
    var locale=S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: CustomButton(
              height: isDeviceInPortrait(context)? 54.h :80.h,
                text: locale.add_to_cart,
                onPressed: () {
                  context.read<CartCubit>().addToCart(
                      cartQuantity: cartQuantity,
                      cartModel: CartModel(
                          productModel: ProductModel.fromEntity(
                            widget.productEntity,
                          ),
                          quantity: cartQuantity));
                }),
          ),
          horizontalSpace(16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   FittedBox(
                    child: Text(
                      locale.quantity,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  CustomTextFormField(
                    isDense: true,
                    fillColor: Colors.white,
                    controller: _controller,
                   style: TextStyles.bold16,
                    textInputType: TextInputType.number,
                    border: InputBorder.none,
                    textAlign: TextAlign.center,
                    contentPadding: EdgeInsets.zero,
                    onChanged: _updateQuantity,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
