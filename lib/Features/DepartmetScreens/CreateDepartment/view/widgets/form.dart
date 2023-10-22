import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/Widgets/default_form_field.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../../../AuthScreens/loginScreen/controller/cubit/login_cubit.dart';


class CreateDpForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  // final TextEditingController managerController;

  const CreateDpForm(
      {super.key,
      required this.formkey,
      required this.emailController,
      // required this.managerController
      });

  @override
  State<CreateDpForm> createState() => _CreateDpFormState();
}

class _CreateDpFormState extends State<CreateDpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Form(
        key: widget.formkey,
        child: Column(
          children: [
            DefaultFormField(
              controller: widget.emailController,
              keyboardType: TextInputType.emailAddress,
              labelText: "Name",
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
            // SizedBox(
            //   height: 20.h,
            // ),
            // DefaultFormField(
            //   controller: widget.passwordController,
            //   keyboardType: TextInputType.visiblePassword,
            //   labelText: "Assigned Manager",
            //   radius: 10,
            //   labelColor: AppColors.darkColor,
            //   textColor: AppColors.darkColor,
            //   cursorColor: Colors.white,
            //   validator: (value) {
            //     if (value!.isEmpty ||
            //         widget.passwordController.text.length <= 7) {
            //       return "please valid password";
            //     }
            //     return null;
            //   },
            // ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      );
    });
  }
}
