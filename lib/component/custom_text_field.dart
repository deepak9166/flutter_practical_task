import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/images.dart';

class CustomTextField extends StatelessWidget {
  final String hindText;
  const CustomTextField({super.key, required this.hindText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      keyboardType: TextInputType.number,
      style: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 18),
      decoration: InputDecoration(
        hintText: hindText,
        hintStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.grey),
      ),
    );
  }
}
