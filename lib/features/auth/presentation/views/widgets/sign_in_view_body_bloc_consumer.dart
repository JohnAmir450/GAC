import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/show_loading_dialog.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/login_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          context.pushNamed(Routes.mainView);
        }
        if (state is SignInFailureState) {
          context.pop();
          showSnackBar(context, text: state.message, color: Colors.red);
        }if (state is SignInLoadingState) {
           showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        return const LoginViewBody();
      },
    );
  }
}
