import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:template/utils/commons/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _flutterSecureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    _setupDelay();
  }

  void _setupDelay() {
    Future.delayed(const Duration(seconds: 2), () async {
      _checkAuthState(
        onAuthenticated: () {
          context.goNamed('dashboard');
        },
        onUnAuthenticated: () {
          context.goNamed('login');
        },
      );
    });
  }

  void _checkAuthState({
    required VoidCallback onAuthenticated,
    required VoidCallback onUnAuthenticated,
  }) async {
    final token = await _flutterSecureStorage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      onAuthenticated();
      return;
    }

    onUnAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: whiteColor,
      child: Image(
        image: AssetImage('assets/images/app_icon_android.png'),
      ),
    );
  }
}
