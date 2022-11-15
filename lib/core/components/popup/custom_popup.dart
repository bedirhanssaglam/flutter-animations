import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Future<dynamic> customPopup(
  BuildContext context, {
  double borderRadius = 8,
  double height = 15,
  double width = 70,
  required Widget child,
  bool? isThereBorder = false,
  bool? isDeletePopup = false,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1).animate(animation),
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          content: SizedBox(
            height: height.h,
            width: width.w,
            child: child,
          ),
        ),
      );
    },
  );
}
