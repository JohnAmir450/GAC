import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/repos/products_repo/products_repo.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  final VoidCallback onNavigateToAllProducts;
  const HomeView({super.key, required this.onNavigateToAllProducts});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child:  HomeViewBody(onNavigateToAllProducts:onNavigateToAllProducts ,),
    ));
  }
}
