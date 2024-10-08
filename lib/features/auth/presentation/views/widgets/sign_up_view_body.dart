import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:gac/features/auth/presentation/views/widgets/terms_and_conditions_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignUpCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: cubit.nameController,
                hintText: 'الاسم بالكامل',
                onChanged: (value) {
                  cubit.nameController.text = value;
                },
              ),
              verticalSpace(16.h),
              CustomTextFormField(
                controller: cubit.emailController,
                hintText: 'البريد الالكتروني',
                onChanged: (value) {
                  cubit.emailController.text = value;
                },
              ),
              verticalSpace(16.h),
              BlocBuilder<SignUpCubit,SignUpState>(
                builder: (context, state) {
                  return CustomTextFormField(
                    isObscured: cubit.isObscured,
                    controller: cubit.passwordController,
                    onChanged: (value) {
                      cubit.passwordController.text = value;
                    },
                    hintText: 'كلمة المرور',
                    suffixIcon: GestureDetector(
                        onTap: () {
                          cubit.changePasswordVisibility();
                        },
                        child: cubit.suffixIcon),
                  );
                },
              ),
              verticalSpace(16.h),
              const TermsAndConditionsWidget(),
              verticalSpace(30.h),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    if (cubit.isTermsChecked) {
                      cubit.createUserWithEmailAndPassword();
                    } else {
                      showSnackBar(context,
                          text: 'يجب الموافقة على الشروط والاحكام',
                          color: Colors.red);
                    }
                  }
                },
              ),
              verticalSpace(25.h),
              const AlreadyHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
