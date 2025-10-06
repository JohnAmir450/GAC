import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/cubits/products_cubit/products_cubit.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/core/utils/custom_snak_bar.dart';
import 'package:gac/core/utils/spacing.dart';
import 'package:gac/generated/l10n.dart';


class CustomEmailVerificationToast extends StatelessWidget {
  const CustomEmailVerificationToast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is CheckUserEmailVerification,
      builder: (context, state) {
        if (state is CheckUserEmailVerification && !state.isVerified) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ProductsCubit>().isEmailVerified = true;
                    context
                        .read<ProductsCubit>()
                        .emit(CheckUserEmailVerification(isVerified: true));
                  },
                  child: const Icon(Icons.close, color: Colors.white),
                ),
                horizontalSpace(4),
                Expanded(
                  child: Text(
                  S.of(context).send_you_email_verification,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.regular13.copyWith(
                      color: Colors.white,
                      fontSize: 12
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                horizontalSpace(8),
                OutlinedButton(
                  onPressed: () {
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      user.sendEmailVerification();
                    }
                    showSnackBar(
                      context,
                      text: S.of(context).email_resent_success,
                      color: Colors.green,
                    );
                  },
                  child: Text(
                    S.of(context).resend,
                    style: TextStyles.semiBold11.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}