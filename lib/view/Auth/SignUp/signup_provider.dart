import 'package:flutter/widgets.dart';

class SignupProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confrimFocusNode = FocusNode();

  ValueNotifier<bool> obsecurePassword = ValueNotifier(false);
  ValueNotifier<bool> obsecureConfirmPassword = ValueNotifier(false);
}
