import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:gac/features/auth/presentation/views/widgets/or_divider.dart';

import 'login_method_item.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<SignInCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
               CustomTextFormField(
                controller: cubit.emailController,
                onChanged: (value){
                  cubit.emailController.text=value;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              verticalSpace(16.h),
               CustomTextFormField(
                controller: cubit.passwordController,
                onChanged: (value){
                  cubit.passwordController.text=value;
                },
                isObscured: cubit.isObscured,
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(onTap: (){
                  cubit.changePasswordVisibility();
                },
                  child: cubit.suffixIcon
                ),
              ),
              verticalSpace(45.h),
               CustomButton(
                onPressed: (){
                  if(cubit.formKey.currentState!.validate()){
                    cubit.signIn();
                  }
                },
                text: 'تسجيل الدخول',
              ),
              verticalSpace(33.h),
              const DontHaveAnAccount(),
              verticalSpace(37.h),
              const OrDivider(),
              verticalSpace(16.h),
               LoginMethodItem(
                onTap: (){
                  cubit.signInWithGoogle();
                },
                image: 'assets/images/google_icon.svg',
                text: 'تسجيل الدخول بواسطة جوجل',
              ),
             
              Visibility(
                visible: Platform.isIOS,
                child: const LoginMethodItem(
                  image: 'assets/images/apple_icon.svg',
                  text: 'تسجيل الدخول بواسطة ابل',
                ),
              ),
              
              const LoginMethodItem(
                image: 'assets/images/facebook_icon.svg',
                text: 'تسجيل الدخول بواسطة فيسبوك',
              )
            ],
          ),
        ),
      ),
    );
  }
}
