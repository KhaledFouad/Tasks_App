import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/Widgets/default_form_field.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../controller/cubit/update_user_cubit.dart';

class UpdateUserForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  final TextEditingController nameController;
  final TextEditingController userTypeController;
  final TextEditingController idController;

  const UpdateUserForm(
      {super.key,
      required this.formkey,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController,
      required this.idController,
      required this.userTypeController});

  @override
  State<UpdateUserForm> createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserCubit, UpdateUserState>(
        builder: (context, state) {
      return Form(
        key: widget.formkey,
        child: Column(
          children: [
            DefaultFormField(
              controller: widget.nameController,
              keyboardType: TextInputType.name,
              labelText: "Name",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultFormField(
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
              labelText: "Email",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultFormField(
              controller: widget.phoneController,
              keyboardType: TextInputType.phone,
              labelText: "Phone",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your phone";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            // DefaultFormField(
            //   controller: widget.passwordController,
            //   keyboardType: TextInputType.visiblePassword,
            //   labelText: "Password",
            //   radius: 10,
            //   labelColor: AppColors.darkColor,
            //   textColor: AppColors.darkColor,
            //   cursorColor: Colors.white,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return "Please enter your Password";
            //     }
            //     return null;
            //   },
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
          ],
        ),
      );
    });
  }
}
