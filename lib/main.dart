import 'package:flutter/material.dart';

import 'core/config/app_colors.dart';
import 'core/config/themes.dart';
import 'features/auth/presentation/screens/sign_in_screen.dart';
import 'injection_container.dart' as di;

void main() {
  // di stands for dependency injection
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(context),
      home: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SignInScreen(),
      ),
    );
  }
}
