import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          context.pushNamed(Routes.mainView);
        }
        if (state is SignUpFailureState) {
         
          showSnackBar(context, text: state.message, color: Colors.red);
        }
        
        if (state is SignUpVerificationSentState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.loading,
            title: 'تم ارسال رابط التفعيل',
            text: 'الرجاء مراجعة البريد الالكتروني لتفعيل حسابك',
            
          );
        }
      },
      builder: (context, state) {
        return  ModalProgressHUD(
          inAsyncCall: state is SignUpLoadingState,
          progressIndicator: CustomAnimatedLoadingWidget(),
          child: SignUpViewBody());
      },
    );
  }
}
