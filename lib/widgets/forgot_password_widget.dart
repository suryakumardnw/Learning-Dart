import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/router/routes.dart';
import 'package:surya_learning_dart/widgets/input.dart';
import 'package:surya_learning_dart/widgets/primary-button.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendResetLinkPressed() {
    final email = _emailController.text.trim();
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          email.isEmpty
              ? 'Please enter your email address.'
              : 'If an account exists for $email, a reset link will be sent.',
        ),
      ),
    );
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
              'Forgot Password',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
              style: bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppInput(
              icon: Icons.email_outlined,
              placeholder: 'Email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'Send reset link',
              onPressed: _onSendResetLinkPressed,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Remember your password? ', style: bodyMedium),
                TextButton(
                  onPressed: () => context.goNamed(AppRoutes.loginName),
                  style: _linkButtonStyle(context),
                  child: Text(
                    'Back to login',
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
