import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/features/auth/data/repos/signin_cubit/signin_cubit.dart';
import 'package:gac/features/auth/domain/repos/auth_repo.dart';
import 'package:gac/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: const Scaffold(
       
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}

