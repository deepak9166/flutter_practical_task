import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/images.dart';

class MobileNumberTextField extends StatelessWidget {
  final String hindText;
  final TextEditingController? textEditingController;
  const MobileNumberTextField({super.key, required this.hindText, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.bottom,
      keyboardType: TextInputType.number,
      style: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.bold, fontSize: 18),
      decoration: InputDecoration(
          hintText: hindText,
          hintStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.grey),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              // textBaseline: TextBaseline.alphabetic,
              children: [
                Image.asset(AppImages.flag),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.black,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '+97',
                  style: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          )),
    );
  }
}
