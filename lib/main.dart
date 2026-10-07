import 'package:flutter/material.dart';
import 'package:surya_learning_dart/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Surya Learning Dart',
      routerConfig: appRouter,
    );
  }
}
