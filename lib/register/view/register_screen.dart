import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/register/register.dart';
import 'package:template/utils/commons/platform_dialog.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) {
          return AuthenticationRepository();
        },
        child: BlocProvider(
          create: (context) {
            return RegisterBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const RegisterContent(),
        ),
      ),
    );
  }
}

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() {
    return RegisterContentState();
  }
}

class RegisterContentState extends State<RegisterContent> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.goNamed('dashboard');
          return;
        }

        if (state is RegisterError) {
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
      child: WillPopScope(
        child: _registerContentWidget(),
        onWillPop: () async {
          context.goNamed('login');
          return false;
        },
      ),
    );
  }

  Widget _registerContentWidget() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(),
    );
  }
}
