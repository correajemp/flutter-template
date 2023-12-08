import 'package:go_router/go_router.dart';
import 'package:template/dashboard/dashboard.dart';
import 'package:template/register/register.dart';
import 'package:template/webview/webview.dart';
import 'login/login.dart';
import 'splash/splash.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      name: 'dashboard',
      path: '/dashboard',
      builder: (context, state) {
        return const DashboardScreen();
      },
    ),
    GoRoute(
      name: 'webview',
      path: '/webview',
      builder: (context, state) {
        return WebViewScreen(
          title: state.queryParameters['title'] ?? '',
          redirectUrl: state.queryParameters['redirect_url'] ?? '',
        );
      },
    ),
  ],
);
