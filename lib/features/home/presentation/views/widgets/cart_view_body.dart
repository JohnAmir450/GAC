import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/home/presentation/views/widgets/cart_products_list.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_all_products_app_bar.dart';
import 'package:gac/features/home/presentation/views/widgets/empty_cart_view_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is RemoveCartItemSuccessState) {
            showSnackBar(context,
                text: 'تم ازالة المنتج من السلة بنجاح',
                color: AppColors.lightPrimaryColor);
          } else if (state is CartCubitChangeProductQuantity) {
            showSnackBar(context,
                text: 'تم تغير كمية المنتج بنجاح',
                color: AppColors.lightPrimaryColor);
          }
        },
        builder: (context, state) {
          if (state is CartCubitGetProductsSuccessState) {
            if (state.products.isNotEmpty) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CustomApplicationAppBar(
                      title: 'سلة التسوق',
                      showNotificationIcon: false,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(30),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      color: const Color(0xffEBF9F1),
                      child: Center(
                        child: Text(
                          'لديك ${state.products.length} منتجات في سلة التسوق',
                          style: TextStyles.bold13,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(30),
                  ),
                  CartProductsList(products: state.products),
                  SliverToBoxAdapter(
                    child: verticalSpace(30),
                  ),
                  SliverToBoxAdapter(
                    child: CustomButton(
                      height: isDeviceInPortrait(context) ? 54.h : 100.h,
                      text:
                          (' تأكيد الطلب : ${context.read<CartCubit>().getTotalPrice(state.products).toString()} جنيه'),
                      onPressed: () {
                        context.pushNamed(
                          Routes.checkoutView,
                          arguments: {
                            'cartItems': state.products,
                            'totalPrice': context
                                .read<CartCubit>()
                                .getTotalPrice(state.products),
                          },
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(30),
                  ),
                ],
              );
            } else {
              return const EmptyListViewWidget(
                title: 'لا يوجد منتجات في سلة التسوق',
                subTitle: 'يمكنك اضافة منتجات من القائمة',
              );
            }
          } else if (state is CartCubitGetProductsFailureState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is CartCubitGetProductsLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          } else {
            return const Center(child: Text('لا يوجد بيانات لعرضها'));
          }
        },
      ),
    );
  }
}
