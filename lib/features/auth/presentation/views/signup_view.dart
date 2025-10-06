import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/auth/data/sign_up_cubit/sign_up_cubit.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/auth/presentation/views/widgets/sign_up_view_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        body: const SignUpViewBlocConsumer(),
      ),
    );
  }
}

