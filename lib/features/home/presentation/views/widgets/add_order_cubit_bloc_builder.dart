import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/checkout/domain/entities/order_entity.dart';
import 'package:gac/features/home/manager/add_order/orders_cubit.dart';
import 'package:gac/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
       if(state is AddOrderSuccessState){
         var orderID=context.read<OrderEntity>().orderId;
        showSnackBar(context, text: S.of(context).order_added_success);
        context.pushReplacementNamed(Routes.orderConfirmedSuccessfullyView,arguments: orderID);
       }else if (state is AddOrderFailureState){
        showSnackBar(context, text: state.errorMessage);
       }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddOrderLoadingState,
          progressIndicator: const CustomAnimatedLoadingWidget(),
          child: child,
          
        );
      },
    );
  }
}
