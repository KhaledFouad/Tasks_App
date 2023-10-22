import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/Widgets/default_button.dart';

import '../../../../HomeScreen/view/HomeScreen.dart';
import '../../controller/cubit/update_user_cubit.dart';

class UpdateUserButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;

  final TextEditingController userTypeController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController userIdController;
  final TextEditingController nameController;

  const UpdateUserButton({
    super.key,
    required this.formkey,
  
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.userIdController,
    required this.userTypeController,
  });
  @override
  Widget build(BuildContext context) {
    final updateUserCubit = BlocProvider.of<UpdateUserCubit>(context);
    return BlocConsumer<UpdateUserCubit, UpdateUserState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultMaterialButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  updateUserCubit.updateUser(
                    newName: nameController.text,
                    newEmail: emailController.text,
                    newPhone: phoneController.text,
                    usertId: userIdController.text,
                    // newPassword: passwordController.text,
                    newUserType: userTypeController.text,
                  
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  Null;
                }
              },
              text: "Update",
              fontSize: 16.sp,
              background: AppColors.primaryColor);
        });
  }
}
