import 'package:form_field_validator/form_field_validator.dart';
import 'package:locus_optimus/core/config/constants.dart';

final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    EmailValidator(errorText: 'Enter a valid email address')
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(
      6,
      errorText: 'Password must be at least six characters long',
    ),
    PatternValidator(
      Constants.passwordRegex,
      errorText: Constants.passwordErrorText,
    )
  ]);