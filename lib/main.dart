import 'package:apis/view/Auth/Login/login.dart';
import 'package:apis/view_model/auth_view_model.dart';
import 'package:apis/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ChangeNotifierProvider(create: (_) => UserViewModel()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: Login(),
          ),
        );
      },
    ),
  );
}
