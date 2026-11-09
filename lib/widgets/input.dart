import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.icon,
    required this.placeholder,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
  });

  final IconData icon;
  final String placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
