import 'package:flutter/material.dart';
import 'package:surya_learning_dart/widgets/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          const SafeArea(child: LoginWidget()),
        ],
      ),
    );
  }
}
