import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/entities/cart_entity.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/quantity_bottom_sheet.dart';
import 'package:gac/generated/l10n.dart';

class CartItemDetailsColumn extends StatelessWidget {
  final CartEntity cartEntity;
  const CartItemDetailsColumn({
    super.key,
    required this.cartEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>()),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartEntity.productEntity.name,
                style: TextStyles.bold16,
                overflow: TextOverflow.ellipsis, // Handles long text
                maxLines: 1,
              ),
              verticalSpace(12),
              Text(
                '${cartEntity.quantity} ${S.of(context).carton}',
                style: TextStyles.semiBold16
                    .copyWith(color: AppColors.secondaryColor),
              ),
              verticalSpace(12),
              Row(
                children: [
                  OutlinedButton(
                    child: Text('${S.of(context).quantity}  ${cartEntity.quantity}'),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => QuantityBottomSheet(
                                productCode: cartEntity.productEntity.code,
                              ));
                    },
                  ),
                  horizontalSpace(16),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
