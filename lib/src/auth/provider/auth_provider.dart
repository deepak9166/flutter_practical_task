import 'package:flutter/material.dart';

import '../../../component/popup.dart';
import '../../../services/local_db_handler.dart';
import '../../home/home_page.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController number = TextEditingController();
  TextEditingController numberLogin = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    var signUpStatus = await LocalDBHandler().signUpUser(number.text.trim());

    if (signUpStatus) {
      showPopUp(context, 'SignUp Success');
    } else {
      showPopUpError(context, 'User already exits');
    }
  }

  Future<void> login(BuildContext context) async {
    var signUpStatus =
        await LocalDBHandler().signInUser(numberLogin.text.trim());

    if (signUpStatus) {
      // ignore: use_build_context_synchronously
      await showPopUp(context, 'Login Success ');
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } else {
      print('user not login');
      showPopUpError(context, 'User not exits');
    }
  }
}
