import 'package:flutter/material.dart';

import 'app_colors.dart';

lightTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: AppColors.primaryColor,
    accentColor: Colors.white,
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    fontFamily: 'PatrickHand',
  );
}
