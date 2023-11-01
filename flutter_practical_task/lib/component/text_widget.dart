import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import '../util/colors.dart';

richText1(String str1, String str2, {Function? onPress}) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(text: str1, style: TextStyle(color: AppColor.black)),
    TextSpan(
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          if (onPress != null) {
            onPress();
          }
        },
      text: str2,
      style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold),
    ),
  ]));
}

heading1Text(String str1) {
  return Text(
    str1,
    style: TextStyle(
        color: AppColor.white, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

heading2Text(String str1) {
  return Text(
    str1,
    style: TextStyle(
        color: AppColor.blueColor, fontWeight: FontWeight.bold, fontSize: 16),
  );
}

heading3Text(String str1) {
  return Text(
    str1,
    style: TextStyle(color: AppColor.white, fontSize: 20),
  );
}

textLabel(String str) {
  return Text(
    str,
    style: TextStyle(color: AppColor.grey, fontSize: 14),
  );
}
