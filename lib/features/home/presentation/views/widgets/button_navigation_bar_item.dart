import 'package:flutter/widgets.dart';
import 'package:gac/features/home/domain/entities/button_navigation_bar_entity.dart';
import 'package:gac/features/home/presentation/views/widgets/active_navigation_item.dart';
import 'package:gac/features/home/presentation/views/widgets/in_active_navigation_item.dart';

class ButtonNavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final ButtonNavigationBarEntity barEntity;
  const ButtonNavigationBarItem({super.key, required this.isSelected, required this.barEntity});

  @override
  Widget build(BuildContext context) {
    return  isSelected? ActiveNavigationItem(title: barEntity.name(context), image: barEntity.activeImage):InActiveNavigationItem(image: barEntity.inActiveImage);
  }
}


