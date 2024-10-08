import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/show_loading_dialog.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if(state is SignUpSuccessState){
          context.pushNamed(Routes.homeView);
        }if(state is SignUpFailureState){
          context.pop();
          showSnackBar(context, text: state.message, color: Colors.red);
        }if(state is SignUpLoadingState){
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        return const SignUpViewBody();
      },
    );
  }
}
