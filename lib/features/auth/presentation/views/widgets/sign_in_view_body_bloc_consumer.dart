import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   

    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async {
        
        if (state is SignInSuccessState) {
         
            context.pushReplacementNamed(Routes.mainView);
          }
        if (state is SignInFailureState) {
          showSnackBar(context, text: state.message, color: Colors.red);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignInLoadingState,
            progressIndicator: const CustomAnimatedLoadingWidget(),
            child: const LoginViewBody());
      },
    );
  }
}
