import 'package:flutter/material.dart';
import 'package:locus_optimus/core/config/app_colors.dart';

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
