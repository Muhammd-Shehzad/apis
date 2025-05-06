import 'package:apis/res/Components/custom_button.dart';
import 'package:apis/utils/utils.dart';
import 'package:apis/view/Auth/Login/login_provider.dart';
import 'package:apis/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

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
                      if (model.emailController.text.isEmpty) {
                        Utils.flashBarErrorMesage('Enter Email', context);
                      } else if (model.passwordController.text.isEmpty) {
                        Utils.flashBarErrorMesage('Enter password', context);
                      } else if (model.passwordController.text.length < 6) {
                        Utils.flashBarErrorMesage('Enter ', context);
                      } else {
                        Map data = {
                          'eamil': model.emailController.text.toString(),
                          'password': model.passwordController.text.toString(),
                        };
                        authViewModel.login(data, context);
                        print('API Hit');
                      }
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
