import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/app_regex.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/helper_functions/is_device_in_portrait.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/core/widgets/custom_text_field.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/generated/l10n.dart';

class UpdateUserProfileViewBody extends StatefulWidget {
  const UpdateUserProfileViewBody({super.key});

  @override
  State<UpdateUserProfileViewBody> createState() =>
      _UpdateUserProfileViewBodyState();
}

class _UpdateUserProfileViewBodyState extends State<UpdateUserProfileViewBody> {
  @override
  initState() {
    context.read<AccountManagerCubit>().firstNameController?.text =
        getUserData().name;
    context.read<AccountManagerCubit>().secondNameController?.text =
        getUserData().secondName;
    context.read<AccountManagerCubit>().phoneNumberController?.text =
        getUserData().phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AccountManagerCubit>();
    var locale = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
                 Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    '${locale.personal_information}: ',
                    style: TextStyles.bold16,
                  )),
              verticalSpace(16),
              CustomTextFormField(
                textInputType: TextInputType.name,
                controller: cubit.firstNameController,
                hintText: locale.first_name,
                onChanged: (value) {
                  cubit.firstNameController?.text = value;
                  cubit.userDataChanged();
                },
              ),
              verticalSpace(16),
              CustomTextFormField(
                 textInputType: TextInputType.name,
                controller: cubit.secondNameController,
                hintText: locale.last_name,
                onChanged: (value) {
                  cubit.secondNameController?.text = value;
                  cubit.userDataChanged();
                },
              ),
              verticalSpace(16),
              CustomTextFormField(
                textInputType: TextInputType.phone,
                controller: cubit.phoneNumberController,
                hintText:locale.phone_number, 
                onChanged: (value) {
                  cubit.phoneNumberController?.text = value;
                  cubit.userDataChanged();
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPhoneNumberValid(value)) {
                    return locale.phone_number_validation;
                  }
                  return null;
                },
              ),
              verticalSpace(MediaQuery.sizeOf(context).height * 0.1),
              BlocBuilder<AccountManagerCubit, AccountManagerState>(
                builder: (context, state) {
                  return CustomButton(
                    height: isDeviceInPortrait(context) ? 54.h : 100.h,
                      text: locale.save_changes,
                      backgroundColor: cubit.hasChanges
                          ? AppColors.primaryColor
                          : Colors.grey,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          if (cubit.hasChanges) {
                            cubit.updateUserData();
                          }
                        }
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
