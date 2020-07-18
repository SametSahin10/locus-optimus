import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/assets.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../core/util/actions.dart';
import '../../../../core/util/navigation.dart';
import '../../../../core/util/validators.dart';
import '../../../../injection_container.dart';
import '../../domain/use_cases/sign_up_use_case.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  bool _termsChecked = false;

  bool _signingUp = false;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  TextEditingController _phoneNumberController;

  FocusNode _passwordFocusNode;
  FocusNode _confirmPasswordFocusNode;
  FocusNode _phoneNumberFocusNode;

  final _emailDecoration = InputDecoration(
    labelText: 'Email',
    labelStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
  );

  final _passwordDecoration = InputDecoration(
    labelText: 'Password',
    labelStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
  );

  final _confirmPasswordDecoration = InputDecoration(
    labelText: 'Confirm Password',
    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.4,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(18)),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
  );

  final _phoneNumberDecoration = InputDecoration(
    labelText: 'Phone Number (Optional)',
    labelStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.4,
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(18),
    ),
  );

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();

    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _phoneNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();

    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: AppColors.primaryColor,
      body: Builder(
        builder: (context) {
          return SafeArea(
            child: ListView(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 36, color: Colors.white),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
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
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: _emailDecoration,
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
                            validator: passwordValidator,
                            controller: _passwordController,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: _passwordDecoration,
                            onChanged: (value) => _password = value,
                            onFieldSubmitted: (value) {
                              _confirmPasswordFocusNode.requestFocus();
                            },
                            onSaved: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          height: screenHeight * 0.08,
                          child: TextFormField(
                            focusNode: _confirmPasswordFocusNode,
                            validator: (value) {
                              return MatchValidator(
                                errorText: 'passwords do not match',
                              ).validateMatch(value, _password);
                            },
                            controller: _confirmPasswordController,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              _phoneNumberFocusNode.requestFocus();
                            },
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: _confirmPasswordDecoration,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          height: screenHeight * 0.08,
                          child: TextFormField(
                            focusNode: _phoneNumberFocusNode,
                            controller: _phoneNumberController,
                            decoration: _phoneNumberDecoration,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _termsChecked,
                            onChanged: (value) {
                              setState(() {
                                _termsChecked = value;
                              });
                            },
                            title: Text(
                              'By continuing you agree to our terms and conditions',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                GestureDetector(
                  child: Text(
                    'Already have an account?\nSign in instead',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () => pushSignIn(context),
                ),
                SizedBox(height: screenHeight * 0.035),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.01,
                    right: screenWidth * 0.01,
                    bottom: screenHeight * 0.02,
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
                          'Sign up',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () => _handleSignUp(context),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _handleSignUp(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        showAlertDialog(
          context: context,
          message: "Signing",
          animPath: Assets.authLoadingAnim,
        );
        _signingUp = true;
      });
      _formKey.currentState.save();
      final signUpUseCase = sl<SignUpUseCase>();
      final user = await signUpUseCase.call(FirebaseUserParams(
        email: _email.trim(),
        password: _password.trim(),
      ));
      if (user != null) {
        print("Signed up successfully");
      } else {
        // Hide alert dialog
        Navigator.of(context).pop();
        print("Sigingin up failed");
        showSnackBar(
          context: context,
          message: "Signin up failed. Try using a different email.",
        );
      }
    }
  }
}
