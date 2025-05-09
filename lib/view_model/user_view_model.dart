import 'package:apis/data/Model/user_model';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', user.token.toString());
    sp.setString('message', user.message.toString());
    sp.setString('user', user.user.toString());

    return true;
  }
}
