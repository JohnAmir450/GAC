import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/app_regex.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/generated/l10n.dart';

class SignUpTextFields extends StatefulWidget {
  const SignUpTextFields({
    super.key,
    required this.cubit,
    this.userEntity,
  });
  final UserEntity? userEntity;
  final SignUpCubit cubit;

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  @override
  void initState() {
    if (widget.userEntity != null) {
      widget.cubit.nameController.text = widget.userEntity!.name;
      widget.cubit.secondNameController.text = widget.userEntity!.secondName;
      widget.cubit.emailController.text = widget.userEntity!.email;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          textInputType: TextInputType.name,
          initialValue: widget.userEntity?.name,
          labelText:
              widget.userEntity?.name == null ? S.of(context).first_name : null,
          onChanged: (value) {
            widget.cubit.nameController.text = value;
          },
        ),
        verticalSpace(16.h),
        CustomTextFormField(
          textInputType: TextInputType.name,
          initialValue: widget.userEntity?.secondName == null
              ? null
              : widget.userEntity!.secondName,
          labelText: widget.userEntity?.secondName == null
              ? S.of(context).last_name
              : null,
          onChanged: (value) {
            widget.cubit.secondNameController.text = value;
          },
        ),
        verticalSpace(16.h),
        CustomTextFormField(
          isEnabled: widget.userEntity?.email == null ? true : false,
          initialValue: widget.userEntity?.email == null
              ? null
              : widget.userEntity!.email,
          labelText: widget.userEntity?.email == null
              ? S.of(context).email_hint
              : null,
          onChanged: (value) {
            widget.cubit.emailController.text = value;
          },
        ),
        verticalSpace(16.h),
        CustomTextFormField(
          initialValue: widget.userEntity?.phoneNumber == null
              ? null
              : widget.userEntity!.phoneNumber,
          textInputType: TextInputType.phone,
          labelText: widget.userEntity?.phoneNumber == null
              ? S.of(context).phone_number
              : null,
          hintText: S.of(context).phone_number,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isPhoneNumberValid(value)) {
              return S.of(context).phone_number_validation;
            }
            return null;
          },
          onChanged: (value) {
            widget.cubit.phoneNumberController.text = value;
          },
        ),
        verticalSpace(16.h),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return CustomTextFormField(
              textInputType: TextInputType.visiblePassword,
              isObscured: widget.cubit.isObscured,
              controller: widget.cubit.passwordController,
              onChanged: (value) {
                widget.cubit.passwordController.text = value;
              },
              hintText: S.of(context).password_hint,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                } else if (!AppRegex.isPasswordValid(value)) {
                  return 'كلمة المرور يجب أن لا تقل عن 8 حروف وارقام،\n وتشمل حرف كبير، حرف صغير';
                }
                return null;
              },
              suffixIcon: GestureDetector(
                  onTap: () {
                    widget.cubit.changePasswordVisibility();
                  },
                  child: widget.cubit.suffixIcon),
            );
          },
        ),
      ],
    );
  }
}
