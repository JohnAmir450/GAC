import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_button.dart';
   
class EmailResetPasswordViewBody extends StatelessWidget {
  const EmailResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignInCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 40.h),
        child: Form(
          key: cubit.resetPasswordFormKey,
          child: Column(
            
            children: [
              CustomTextFormField(
                hintText: 'اكتب البريد الالكتروني لاعادة تعيين كلمة المرور',
                onChanged: (value) {
                  cubit.emailToResetPasswordController.text = value;
                },
              ),
              verticalSpace(24),
              CustomButton(
                  text: 'ارسال رسالة لاعادة التعيين ',
                  onPressed: () {
                    if (cubit.resetPasswordFormKey.currentState!.validate()) {
                      cubit.sendEmailToResetPassword();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}