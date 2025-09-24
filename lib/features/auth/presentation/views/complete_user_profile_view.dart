import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/domain/entities/user_entity.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/auth/presentation/views/widgets/complete_user_profile_view_body.dart';

class CompleteUserProfileView extends StatelessWidget {
  final UserEntity? userEntity;
  const CompleteUserProfileView({super.key, this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(child: CompleteUserProfileViewBody(userEntity: userEntity)),
      ),
    );
  }
}


