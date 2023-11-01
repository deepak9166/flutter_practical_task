import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showPopUp(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        height: 100,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
              Text(
                msg,
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
Future showPopUpError(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: SizedBox(
        height: 100,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(
                  Icons.warning,
                  color: Colors.black,
                ),
              ),
              Text(
                msg,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
