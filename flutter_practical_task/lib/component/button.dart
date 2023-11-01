import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical_task/util/colors.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String label;
  final IconData? icon;
  const CustomButton(
      {super.key, this.icon, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: AppColor.blueColor,
        onPressed: () {
          onPress();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
