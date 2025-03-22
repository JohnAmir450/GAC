import 'package:flutter/material.dart';
import 'package:gac/features/home/presentation/views/all_products_view.dart';
import 'package:gac/features/home/presentation/views/cart_view.dart';
import 'package:gac/features/home/presentation/views/home_view.dart';
import 'package:gac/features/home/presentation/views/widgets/custom_button_navigation_bar.dart';
import 'package:gac/features/user_account/presentation/views/user_account_view.dart';

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
  void navigateToHomeScreen() {
    _onItemTapped(0);
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
         UserAccountView(navigateToHomeScreen: navigateToHomeScreen,),
    ],),
    );
  }
}
 
