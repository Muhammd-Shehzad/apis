import 'package:apis/repositery/auth_repositery.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepositery();

  Future<void> login(data, BuildContext context) async {
    _myRepo
        .loginApi(data)
        .then((v) {
          if (kDebugMode) {
            print(v.toString());
          }
        })
        .onError((error, StackTrace) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
