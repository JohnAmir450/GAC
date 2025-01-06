import 'package:flutter/material.dart';
import 'package:gac/core/widgets/inactive_step_item.dart';

import '../../../../../core/widgets/active_step_item.dart';

class StepItem extends StatelessWidget {
  final String text;
  final bool isActive;
  const StepItem({super.key, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InActiveStepItem(text: text),
        secondChild: ActiveStepItem(text: text),
        crossFadeState:isActive? CrossFadeState.showSecond:CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300));
  }
}