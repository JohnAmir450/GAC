import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:gac/core/repos/cart_repo/cart_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/home/presentation/views/widgets/cart_view_body.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: BlocProvider(
        create: (context) => CartCubit(
          getIt.get<CartRepo>(),
        )..getCartProducts(),
        child: const CartViewBody(),
      ),
    );
  }
}



