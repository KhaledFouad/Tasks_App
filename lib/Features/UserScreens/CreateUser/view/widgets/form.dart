import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/Widgets/default_form_field.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../controller/cubit/create_user_cubit.dart';

class CreateUserForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final TextEditingController dpIdController;
  final TextEditingController userTypeController;
  final TextEditingController passwordController;
  const CreateUserForm(
      {super.key,
      required this.formkey,
      required this.emailController,
      required this.phoneController,
      required this.nameController,
      required this.passwordController,
      required this.dpIdController,
      required this.userTypeController});

  @override
  State<CreateUserForm> createState() => _CreateUserFormState();
}

class _CreateUserFormState extends State<CreateUserForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
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
                if (value!.isEmpty ||
                    widget.passwordController.text.length <= 7) {
                  return "please valid email";
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
                if (value!.isEmpty ||
                    widget.passwordController.text.length <= 7) {
                  return "please valid phone";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultFormField(
              controller: widget.passwordController,
              keyboardType: TextInputType.visiblePassword,
              labelText: "Password",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty ||
                    widget.passwordController.text.length <= 7) {
                  return "please valid password";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultFormField(
              controller: widget.dpIdController,
              keyboardType: TextInputType.number,
              labelText: "Department ID",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty ||
                    widget.passwordController.text.length <= 7) {
                  return "please valid Department ID";
                }
                return null;
              },
            ),
          ],
        ),
      );
    });
  }
}
