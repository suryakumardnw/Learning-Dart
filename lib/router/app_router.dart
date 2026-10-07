import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/screens/login_screen.dart';
import 'package:surya_learning_dart/screens/register_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
