import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_app_bar.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/auth/presentation/views/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child:  Scaffold(
        appBar: buildAppBar(context, title: 'اعادة تعين الرقم السري', visibleLeading: false),
          body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
         if(state is SendEmailToResetPasswordSuccessState){
              showSnackBar(context, text: 'تم ارسال رسالة اعادة تعين الرقم السري الخاص بك');
            }
            if(state is SendEmailToResetPasswordFailureState){  
              showSnackBar(context, text: state.errMessage, color: Colors.red);
            }
        },
        child: const EmailResetPasswordViewBody(),
      )),
    );
  }
}