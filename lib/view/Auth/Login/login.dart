import 'package:apis/res/Components/custom_button.dart';
import 'package:apis/utils/utils.dart';
import 'package:apis/view/Auth/Login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder:
            (context, model, child) => Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    title: 'Login',
                    onPressed: () {
                      print('Login button pressed');
                    },
                    isLoading: false,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
