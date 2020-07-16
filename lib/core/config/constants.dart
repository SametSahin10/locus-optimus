class Constants {
  // HTTP Headers
  static const contentTypeApplicationJson = "application/json";

  static const passwordRegex =
      '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{6,}\$';
  static const passwordErrorText =
      'Password must contain at least one upper case, one lower case,\none digit, one special character and must be minimum six characters long';
}