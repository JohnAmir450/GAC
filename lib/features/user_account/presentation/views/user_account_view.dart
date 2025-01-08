import 'package:flutter/material.dart';
import 'package:gac/features/user_account/presentation/views/widgets/user_account_view_body.dart';


class UserAccountView extends StatelessWidget {
  const UserAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:UserAccountViewBody()
    );
  }
}

