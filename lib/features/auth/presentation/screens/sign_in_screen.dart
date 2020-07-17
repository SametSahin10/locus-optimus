import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/assets.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../core/util/actions.dart';
import '../../../../core/util/navigation.dart';
import '../../../../core/util/validators.dart';
import '../../../../injection_container.dart';
import '../../domain/use_cases/sign_in_use_case.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  TextEditingController _emailController;
  TextEditingController _passwordController;

  FocusNode _passwordFocusNode;

  final _emailDecoration = InputDecoration(
    labelText: 'Email',
    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.4, color: Colors.white),
      borderRadius: BorderRadius.circular(18),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.4, color: Colors.red),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.4, color: Colors.white),
      borderRadius: BorderRadius.circular(18),
    ),
  );

  final _passwordDecoration = InputDecoration(
    labelText: 'Password',
    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.4, color: Colors.white),
      borderRadius: BorderRadius.circular(18),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.4, color: Colors.red),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.4, color: Colors.white),
      borderRadius: BorderRadius.circular(18),
    ),
  );

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomPadding: true,
      body: ListView(
        children: <Widget>[
          Center(
            child: Text(
              'Locus Optimus',
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          SizedBox(height: screenHeight * 0.05),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.08,
                    child: TextFormField(
                      validator: emailValidator,
                      autofocus: false,
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _emailDecoration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      onFieldSubmitted: (value) {
                        _passwordFocusNode.requestFocus();
                      },
                      onSaved: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    height: screenHeight * 0.08,
                    child: TextFormField(
                      focusNode: _passwordFocusNode,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: _passwordDecoration,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      onSaved: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          GestureDetector(
            child: Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            onTap: () => pushSignUp(context),
          ),
          SizedBox(height: screenHeight * 0.12),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.01,
              right: screenWidth * 0.01,
              bottom: screenHeight * 0.015,
            ),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.015,
                ),
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: _handleSignIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSignIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        showProgressDialog(
          context: context,
          text: "Signing in",
          animPath: Assets.authLoadingAnim,
        );
      });
      _formKey.currentState.save();
      final signInUseCase = sl<SignInUseCase>();
      final firebaseUser = await signInUseCase.call(
        FirebaseUserParams(
          email: _email.trim(),
          password: _password.trim(),
        ),
      );
    }
  }
}
