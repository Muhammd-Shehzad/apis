import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool loading;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        width: 200.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child:
              loading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                    title,
                    style: TextStyle(fontSize: 20.sp, color: Colors.white),
                  ),
        ),
      ),
    );
  }
}
