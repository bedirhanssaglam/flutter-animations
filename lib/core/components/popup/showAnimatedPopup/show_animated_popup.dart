import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../base/functions/base_functions.dart';
import '../../text/custom_text.dart';
import '../custom_popup.dart';

Future<dynamic> showAnimatedPopup(BuildContext context) {
  return customPopup(context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
            "This is an animated popup.",
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp),
          ),
          InkWell(
            onTap: () => closePopup(context),
            child: Icon(
              Icons.close,
              size: 15.sp,
              color: Colors.white,
            ),
          ),
        ],
      ));
}
