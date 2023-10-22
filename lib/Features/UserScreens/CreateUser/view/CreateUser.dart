import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';

import 'widgets/CreateUser.dart';
import 'widgets/UserTypeWidget.dart';
import 'widgets/form.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController(text: "khaled");
  TextEditingController emailController =
      TextEditingController(text: "khaled@gmail.com");
  TextEditingController phoneController =
      TextEditingController(text: "01066036396");

  TextEditingController passwordController =
      TextEditingController(text: "123456789");
  TextEditingController dpIdController = TextEditingController(text: "144");
  TextEditingController userTypeController = TextEditingController(text: "2");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 50.sp),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              AppStrings.createUserTitle,
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
              AppStrings.createUserSubTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                  fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            CreateUserForm(
              formkey: formkey,
              emailController: emailController,
              passwordController: passwordController,
              phoneController: phoneController,
              nameController: nameController,
              dpIdController: dpIdController,
              userTypeController: userTypeController,
            ),
            SizedBox(
              height: 20.h,
            ),
            const UserTypeGroup(),
            SizedBox(
              height: 20.h,
            ),
            CreateUserButton(
              formkey: formkey,
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              phoneController: phoneController,
              dpIdController: dpIdController,
              userTypeController: userTypeController,
            )
          ],
        ),
      ),
    );
  }
}
