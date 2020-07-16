import 'package:flutter/material.dart';
import 'package:locus_optimus/core/config/app_colors.dart';
import 'package:lottie/lottie.dart';

void showProgressDialog({
  @required BuildContext context,
  @required String text,
  @required String animPath,
}) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 28,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        content: Lottie.asset(
          animPath,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      );
    },
  );
}

void showSnackBar({
  @required  BuildContext context,
  @required String message,
}) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontFamily: "PatrickHand",
            ),
          )
        ],
      ),
    ),
  );
}

void showAlertDialog({
  @required BuildContext context,
  @required String message,
  @required String animPath,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        content: Lottie.asset(
          animPath,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      );
    },
  );
}
