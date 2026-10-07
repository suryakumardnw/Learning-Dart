import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/widgets/input.dart';
import 'package:surya_learning_dart/widgets/primary-button.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onRegisterPressed() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    debugPrint('Register: $name, $email, $password');
  }

  ButtonStyle _linkButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.primary,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final primary = Theme.of(context).colorScheme.primary;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            Text(
              'Register',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppInput(
              icon: Icons.person_outline,
              placeholder: 'Full name',
              controller: _nameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            AppInput(
              icon: Icons.email_outlined,
              placeholder: 'Email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            AppInput(
              icon: Icons.lock_outline,
              placeholder: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 28),
            PrimaryButton(label: 'Register', onPressed: onRegisterPressed),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ', style: bodyMedium),
                TextButton(
                  onPressed: () => context.goNamed(AppRoutes.loginName),
                  style: _linkButtonStyle(context),
                  child: Text(
                    'Login',
                    style: bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
