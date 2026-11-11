import 'package:flutter/material.dart';
import 'package:surya_learning_dart/widgets/forgot_password_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: const AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover,
          ),
          const SafeArea(child: ForgotPasswordWidget()),
        ],
      ),
    );
  }
}
