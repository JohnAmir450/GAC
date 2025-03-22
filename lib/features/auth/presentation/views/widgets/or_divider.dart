import 'package:flutter/material.dart';
import 'package:gac/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
        const Expanded(child: Divider()),
        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(S.of(context).or,),
        ),
        const Expanded(child: Divider())
      ],);
  }
}