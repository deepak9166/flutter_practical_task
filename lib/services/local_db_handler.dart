// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class LocalDBHandler {
  // static const String userBox = 'users';
  hiveInit() async {
    await Hive.initFlutter();
    await openHiveBox();
  }

  openHiveBox() async {
    await Hive.openBox<String>('users');
  }

  Future<bool> signUpUser(String number) async {
    bool checkAlready = checkAlreadyUser(number);

    if (checkAlready) {
      print('user already exist');
      return false;
    }

    var userBox = Hive.box<String>('users');

    await userBox.add(number);

    return true;
  }

  Future<bool> signInUser(String number) async {
    print('check number $number');
    var userBox = Hive.box<String>('users');
    var users = userBox.values.toList();
    print('users -- ${users}');
    try {
      var user = users.firstWhere((element) => element.toLowerCase() == number);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool checkAlreadyUser(String number) {
    var userBox = Hive.box<String>('users');
    var users = userBox.values.toList();
    try {
      var user = users.firstWhere((element) => element.toLowerCase() == number);
      return true;
    } catch (e) {
      return false;
    }
  }

  logOutUser() {}
}
