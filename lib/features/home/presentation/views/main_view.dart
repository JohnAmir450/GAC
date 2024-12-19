import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gac/features/home/presentation/views/all_products_view.dart';
import 'package:gac/features/home/presentation/views/cart_view.dart';
import 'package:gac/features/home/presentation/views/home_view.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_button_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

 

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  void navigateToAllProducts() {
    _onItemTapped(1);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(selectedIndex:selectedIndex ,onItemTapped:_onItemTapped ,),
    
    body: IndexedStack(
      index: selectedIndex,
      children: [
        HomeView(onNavigateToAllProducts: navigateToAllProducts,),
        const AllProductsView(),
        const CartView(),
    ],),
    );
  }
  Widget _getSelectedScreen() {
    
    switch (selectedIndex) {
      case 0:
        return HomeView(onNavigateToAllProducts: navigateToAllProducts,); 
      case 1:
        return const AllProductsView(); 
      case 2:
      return const CartView();
      default:
        return HomeView(onNavigateToAllProducts: navigateToAllProducts,);
    }
  }
}
 
