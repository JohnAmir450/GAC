import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/helper_functions/get_user_data.dart';
import 'package:gac/core/utils/app_images.dart';
import 'package:gac/core/utils/app_text_styles.dart';
import 'package:gac/features/user_account/presentation/manager/account_manager_cubit/account_manager_cubit.dart';
import 'package:gac/generated/l10n.dart';
import '../../../../../core/utils/spacing.dart';

class CustomUserAccountViewHeader extends StatelessWidget {
  const CustomUserAccountViewHeader({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
   
    return Row(
      children: [
        CircleAvatar(
          radius: MediaQuery.sizeOf(context).width * 0.08,
          backgroundImage: const AssetImage(Assets.assetsImagesProfilePicture),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getUserData().name,
                style: TextStyles.bold16.copyWith(),
              ),
              verticalSpace(2),
              Text(
                getUserData().email,
                style: TextStyles.regular16.copyWith(
                  color: const Color(0xff949D9E),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              BlocBuilder<AccountManagerCubit,AccountManagerState>(
                builder: (context, state) {
                   var cubit = context.watch<AccountManagerCubit>();
                  return Text(
                    '${S.of(context).available_points} ${cubit.userPoints}',
                    style: TextStyles.regular16
                        .copyWith(color: const Color(0xff949D9E)),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
