import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/screens/edit_profile_screen.dart';
import 'package:surya_learning_dart/screens/forgot_password_screen.dart';
import 'package:surya_learning_dart/screens/home_screen.dart';
import 'package:surya_learning_dart/screens/login_screen.dart';
import 'package:surya_learning_dart/screens/profile_screen.dart';
import 'package:surya_learning_dart/screens/register_screen.dart';
import 'package:surya_learning_dart/screens/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.loginPath,
  routes: [
    GoRoute(
      path: AppRoutes.loginPath,
      name: AppRoutes.loginName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerPath,
      name: AppRoutes.registerName,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPasswordPath,
      name: AppRoutes.forgotPasswordName,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.homePath,
      name: AppRoutes.homeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.profilePath,
      name: AppRoutes.profileName,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.editProfilePath,
      name: AppRoutes.editProfileName,
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: AppRoutes.settingsPath,
      name: AppRoutes.settingsName,
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
