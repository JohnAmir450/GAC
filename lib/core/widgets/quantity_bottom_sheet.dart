import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';

class QuantityBottomSheet extends StatelessWidget {
  final String productCode;

  const QuantityBottomSheet({super.key, required this.productCode});

  @override
  Widget build(BuildContext context) {
    bool isProcessing = false;
    return BlocProvider(
      create: (context) => CartCubit(getIt.get<CartRepo>()),
      child: Column(
        children: [
          verticalSpace(16),
          Container(
            height: 6,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartCubitChangeProductQuantity) {
                  showSnackBar(context,
                      text: 'تم تغير كمية المنتج بنجاح',
                      color: AppColors.lightPrimaryColor);
                } else if (state is CartCubitProductQuantityExceeds) {
                  showSnackBar(context,
                      text: state.exceedsMessage, color: Colors.red);
                }
              },
              builder: (context, state) {
                return ListView.separated(
                  itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: InkWell(
                            onTap: () async {
                              if (isProcessing) return;
                              isProcessing = true;

                              await context
                                  .read<CartCubit>()
                                  .changeProductQuantity(
                                      productCode, index + 1);
                              Navigator.pop(context);

                              isProcessing = false;
                            },
                            child: Text(
                              '${index + 1}',
                              style: TextStyles.bold23,
                              textAlign: TextAlign.center,
                            )),
                      )),
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: 50,
                );
              },
            ),
          ),
          verticalSpace(30)
        ],
      ),
    );
  }
}
