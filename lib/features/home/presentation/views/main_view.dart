import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(selectedIndex:selectedIndex ,onItemTapped:_onItemTapped ,),
    
    body: _getSelectedScreen(),
    );
  }
  Widget _getSelectedScreen() {
    
    switch (selectedIndex) {
      case 0:
        return HomeView(); 
      case 1:
        return HomeView(); 
      default:
        return HomeView();
    }
  }
}
 
