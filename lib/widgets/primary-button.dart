import 'package:flutter/material.dart';
import 'package:surya_learning_dart/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.onPrimaryColor,
      ),
      child: Text(label),
    );
  }
}
