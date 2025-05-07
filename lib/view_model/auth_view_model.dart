import 'package:apis/repositery/auth_repositery.dart';
import 'package:apis/utils/utils.dart';
import 'package:apis/view/Auth/SignUp/signup.dart';
import 'package:apis/view/Home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepositery();

  //used for circularIndacator
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get SignUpLoading => _loading;
  setSignUpLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((v) {
          Utils.flashBarErrorMesage('Login Successfuly', context);
          setLoading(false);
          if (kDebugMode) {
            print('Api Hit'.toString());
          }
          Get.to(HomeScreen());
        })
        .onError((error, StackTrace) {
          Utils.flashBarErrorMesage(
            'No Internet Connection' + error.toString(),
            context,
          );
          setLoading(false);

          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  Future<void> Signup(data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo
        .signUpApi(data)
        .then((v) {
          Utils.flashBarErrorMesage('Sign Up Successfuly', context);
          if (kDebugMode) {
            print('Api Hit'.toString());
          }
          setSignUpLoading(false);

          Get.to(HomeScreen());
        })
        .onError((error, StackTrace) {
          Utils.flashBarErrorMesage(
            'No Internet Connection' + error.toString(),
            context,
          );
          setSignUpLoading(false);

          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
