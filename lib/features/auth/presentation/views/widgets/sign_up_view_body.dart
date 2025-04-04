import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/app_regex.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:gac/features/auth/presentation/views/widgets/show_terms_and_conditions_dialog.dart';
import 'package:gac/generated/l10n.dart';

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
                textInputType: TextInputType.name,
                controller: cubit.nameController,
                hintText:  S.of(context).first_name,
                onChanged: (value) {
                  cubit.nameController.text = value;
                },
              ),
              verticalSpace(16.h),
              CustomTextFormField(
                textInputType: TextInputType.name,
                controller: cubit.secondNameController,
                hintText:  S.of(context).last_name,
                onChanged: (value) {
                  cubit.secondNameController.text = value;
                },
              ),
              verticalSpace(16.h),
              CustomTextFormField(
                controller: cubit.emailController,
                hintText:  S.of(context).email_hint,
                onChanged: (value) {
                  cubit.emailController.text = value;
                },
              ),
              verticalSpace(16.h),
              CustomTextFormField(
                controller: cubit.phoneNumberController,
                textInputType: TextInputType.phone,
                hintText:  S.of(context).phone_number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPhoneNumberValid(value)) {
                    return  S.of(context).phone_number_validation;
                  }
                  return null;
                },
                onChanged: (value) {
                  cubit.phoneNumberController.text = value;
                },
              ),
              verticalSpace(16.h),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return CustomTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    isObscured: cubit.isObscured,
                    controller: cubit.passwordController,
                    onChanged: (value) {
                      cubit.passwordController.text = value;
                    },
                    hintText:  S.of(context).password_hint,
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
                height: isDeviceInPortrait(context) ? 54.h : 100.h,
                text:  S.of(context).create_account,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    if (cubit.isTermsChecked) {
                      cubit.createUserWithEmailAndPassword();
                    } else {
                      showSnackBar(context,
                          text:  S.of(context).needs_to_accept_terms,
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
