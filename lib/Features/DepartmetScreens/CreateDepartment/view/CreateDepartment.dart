import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';

import 'widgets/CreateButton.dart';
import 'widgets/form.dart';

class CreateDepartmentScreen extends StatefulWidget {
  const CreateDepartmentScreen({super.key});

  @override
  State<CreateDepartmentScreen> createState() => _CreateDepartmentScreenState();
}

class _CreateDepartmentScreenState extends State<CreateDepartmentScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 100.sp),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              AppStrings.createDpDPTitle,
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
              AppStrings.createDPSubTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                  fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            CreateDpForm(
              formkey: formkey,
              emailController: nameController,
              // passwordController: managerController
            ),
            CreateButton(
              formkey: formkey,
              nameController: nameController,
              // managerController: managerController
            ),
          ],
        ),
      ),
    );
  }
}
