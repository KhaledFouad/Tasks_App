import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/Widgets/default_button.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../../../HomeScreen/view/HomeScreen.dart';
import '../../controller/cubit/create_user_cubit.dart';


class CreateUserButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
   final TextEditingController dpIdController;
  final TextEditingController userTypeController;
  final TextEditingController passwordController;

  const CreateUserButton({
    super.key,
    required this.formkey,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
     required this.dpIdController,
    required this.userTypeController,
  });

  @override
  Widget build(BuildContext context) {
    final createUserCubit = BlocProvider.of<CreateUserCubit>(context);
    return BlocConsumer<CreateUserCubit, CreateUserState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultMaterialButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  createUserCubit.addUser(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    // departmentid: dpIdController.text,
                    password: passwordController.text,
                    usertype: userTypeController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  Null;
                }
              },
              text: "Create",
              fontSize: 16.sp,
              background: AppColors.primaryColor);
        });
  }
}
