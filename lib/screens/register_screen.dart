import 'package:flutter/material.dart';
import 'package:surya_learning_dart/widgets/register_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          const SafeArea(child: RegisterWidget()),
        ],
      ),
    );
  }
}
