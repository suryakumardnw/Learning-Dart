import 'package:flutter/material.dart';

/// A styled text input with a leading [icon] and placeholder text.
///
/// Wrap common [TextField] configuration so forms across the app
/// stay visually consistent.
class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.icon,
    required this.placeholder,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
  });

  /// Icon shown before the input field.
  final IconData icon;
  /// Hint text displayed when the field is empty.
  final String placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  /// Whether to hide the entered text (passwords).
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
