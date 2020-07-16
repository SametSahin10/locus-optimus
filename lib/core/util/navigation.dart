import 'package:flutter/material.dart';
import 'package:locus_optimus/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:locus_optimus/features/auth/presentation/screens/sign_up_screen.dart';

void pushSignUp(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext context) {
      return SignUpScreen();
    }),
  );
}

void pushSignIn(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (BuildContext context) {
      return SignInScreen();
    }),
  );
}