import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/custom_quick_alret_view.dart';
import 'package:gac/core/helper_functions/extentions.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/core/widgets/custom_animated_loading_widget.dart';
import 'package:gac/core/widgets/custom_button.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/presentation/views/widgets/show_terms_and_conditions_dialog.dart';
import 'package:gac/features/auth/presentation/views/widgets/sign_up_text_fields.dart';
import 'package:gac/generated/l10n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quickalert/models/quickalert_type.dart';

class CompleteUserProfileViewBody extends StatelessWidget {
  final UserEntity? userEntity;
  const CompleteUserProfileViewBody({super.key, this.userEntity});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          context.pushNamedAndRemoveUntil(
            Routes.mainView,
            predicate: (Route<dynamic> route) => false,
          );
        }
        if (state is SignUpFailureState) {
          customQuickAlertView(
            context,
            text: state.message,
            title: S.of(context).error_dialog_title,
            confirmBtnText: S.of(context).ok,
            type: QuickAlertType.error,
            onConfirmBtnTap: () {
              context.pop();
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoadingState,
          progressIndicator: const CustomAnimatedLoadingWidget(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                                  await cubit.deleteUserData(userEntity!.uId);
                                  if (context.mounted) {
                                    context.pushNamedAndRemoveUntil(
                                      Routes.loginView,
                                      predicate: (route) => false,
                                    );
                                  }
                                },
                        icon: const Icon(Icons.close),
                      ),
                      Text(S.of(context).confirm_your_profile, style: TextStyles.bold23),
                    ],
                  ),
                  verticalSpace(20),
                  SignUpTextFields(cubit: cubit, userEntity: userEntity),
                  verticalSpace(30),
                  const TermsAndConditionsWidget(),
                  verticalSpace(30),
                  CustomButton(text: S.of(context).sign_up,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        if (cubit.isTermsChecked) {
                          cubit.completeGoogleSignUp(userId: userEntity!.uId);
                        } else {
                          showSnackBar(context,
                              text: S.of(context).needs_to_accept_terms,
                              color: Colors.red);
                        }
                      }
                    }
                  )
                ],
              ),
            ),
          ));
      },
    );
  }
}
