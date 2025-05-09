import 'package:apis/res/Components/custom_button.dart';
import 'package:apis/utils/utils.dart';
import 'package:apis/view/Auth/Login/login.dart';
import 'package:apis/view/Auth/SignUp/signup_provider.dart';
import 'package:apis/view_model/auth_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return ChangeNotifierProvider(
      create: (context) => SignupProvider(),
      child: Consumer<SignupProvider>(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(title: Text('Sign Up')),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: model.nameController,
                      focusNode: model.nameFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefix: Icon(Icons.person),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            model.emailController.clear();
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted:
                          (value) => Utils.fieldFocusChnage(
                            context,
                            model.nameFocusNode,
                            model.emailFocusNode,
                          ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: model.emailController,
                      focusNode: model.emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefix: Icon(Icons.email),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            model.emailController.clear();
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted:
                          (value) => Utils.fieldFocusChnage(
                            context,
                            model.emailFocusNode,
                            model.passwordFocusNode,
                          ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ValueListenableBuilder(
                      valueListenable: model.obsecurePassword,
                      builder:
                          (context, value, child) => TextFormField(
                            controller: model.passwordController,
                            focusNode: model.passwordFocusNode,
                            obscureText: model.obsecurePassword.value,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',

                              prefix: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                onTap: () {
                                  model.obsecurePassword.value =
                                      !model.obsecurePassword.value;
                                },
                                child:
                                    model.obsecurePassword.value
                                        ? Icon(Icons.visibility_off_outlined)
                                        : Icon(Icons.visibility),
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onFieldSubmitted:
                                (value) => Utils.fieldFocusChnage(
                                  context,
                                  model.passwordFocusNode,
                                  model.confrimFocusNode,
                                ),
                          ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ValueListenableBuilder(
                      valueListenable: model.obsecureConfirmPassword,
                      builder:
                          (context, value, child) => TextFormField(
                            controller: model.confirmPasswordController,
                            focusNode: model.confrimFocusNode,
                            obscureText: model.obsecureConfirmPassword.value,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'confirm Password',

                              prefix: Icon(Icons.lock),
                              suffixIcon: InkWell(
                                onTap: () {
                                  model.obsecurePassword.value =
                                      !model.obsecureConfirmPassword.value;
                                },
                                child:
                                    model.obsecureConfirmPassword.value
                                        ? Icon(Icons.visibility_off_outlined)
                                        : Icon(Icons.visibility),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    title: 'Signup',
                    loading: AuthViewModel().loading,

                    onPressed: () {
                      if (model.nameController.text.isEmpty) {
                        Utils.flashBarErrorMesage('Enter Name', context);
                      } else if (model.emailController.text.isEmpty) {
                        Utils.flashBarErrorMesage('Enter Email', context);
                      } else if (model.passwordController.text.length < 6) {
                        Utils.flashBarErrorMesage('Enter Password', context);
                      } else if (model.confirmPasswordController.text.isEmpty) {
                        Utils.flashBarErrorMesage(
                          'Enter Confirm Password',
                          context,
                        );
                      } else {
                        Map data = {
                          'name': model.nameController.text.toString(),
                          'email': model.emailController.text.toString(),
                          'password': model.passwordController.text.toString(),
                          'confirmPassword':
                              model.confirmPasswordController.text.toString(),
                        };
                        authViewModel.Signup(data, context);
                        print('API Hit');
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text.rich(
                    TextSpan(
                      text: "You have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(Login());
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
    ;
  }
}
