import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:gac/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:gac/generated/l10n.dart';
import 'login_method_item.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignInCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50.h,top: 8),
                child: Text(S.of(context).sign_in, style: TextStyles.bold19),
              ),
              CustomTextFormField(
                controller: cubit.emailController,
                onChanged: (value) {
                  cubit.emailController.text = value;
                },
                hintText: S.of(context).email_hint,
                textInputType: TextInputType.emailAddress,
              ),
              verticalSpace(16.h),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    controller: cubit.passwordController,
                    onChanged: (value) {
                      cubit.passwordController.text = value;
                    },
                    isObscured: cubit.isObscured,
                    hintText:S.of(context).password_hint,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          cubit.changePasswordVisibility();
                        },
                        child: cubit.suffixIcon),
                  );
                },
              ),
              verticalSpace(45.h),
              CustomButton(
                height: isDeviceInPortrait(context) ? 54.h : 100.h,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.signIn();
                  }
                },
                text: S.of(context).sign_in,
              ),
               verticalSpace(8.h),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(onPressed: (){
                  context.pushNamed(Routes.resetPasswordView);
                },child: Text(S.of(context).forget_password,style: TextStyles.bold13.copyWith(color: AppColors.primaryColor)),)),
              verticalSpace(16.h),
              const DontHaveAnAccount(),
              verticalSpace(37.h),
              const OrDivider(),
              verticalSpace(16.h),
              LoginMethodItem(
                onTap: () {
                 
                  cubit.signInWithGoogle();
                   
                },
                image: Assets.assetsImagesGoogleIcon,
                text: S.of(context).sign_with_google,
              ),
              Visibility(
                visible: Platform.isIOS,
                child: const LoginMethodItem(
                  image: Assets.assetsImagesAppleIcon,
                  text: 'تسجيل الدخول بواسطة ابل',
                ),
              ),
              LoginMethodItem(
                onTap: () {
                  cubit.signInWithFacebook();
                },
                image: Assets.assetsImagesFacebookIcon,
                text:S.of(context).sign_with_facebook,
              )
            ],
          ),
        ),
      ),
    );
  }
}
