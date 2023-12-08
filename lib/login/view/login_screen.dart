import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/login/login.dart';
import 'package:template/utils/commons/platform_dialog.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) {
          return AuthenticationRepository();
        },
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const LoginContent(),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() {
    return LoginContentState();
  }
}

class LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.goNamed('dashboard');
          return;
        }

        if (state is LoginError) {
          showPlatformDialog(
            context: context,
            content: state.message,
            positiveText: '',
            negativeText: 'Close',
            positiveCallback: null,
            negativeCallback: null,
            isShowPositiveButton: false,
          );
          return;
        }
      },
      child: _loginContentWidget(),
    );
  }

  Widget _loginContentWidget() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(),
    );
  }
}
