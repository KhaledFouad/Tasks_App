import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';

import 'widgets/LoginButton.dart';
import 'widgets/form.dart';
import 'widgets/remeberMe.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: "a@a.com");
  TextEditingController passwordController =
      TextEditingController(text: "password");
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 100.sp),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.loginMessageTitle,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkColor,
                    fontSize: 34.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppStrings.loginMessageSubtitle,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                    fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              FormWidget(
                formkey: formkey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const RememberMe(),
              SizedBox(
                height: 20.h,
              ),
              LoginButton(
                formkey: formkey,
                emailController: emailController,
                passwordController: passwordController,
              )
            ],
          ),
        ),
      );
  }
}
