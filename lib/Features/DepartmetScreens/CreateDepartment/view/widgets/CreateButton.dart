import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/Widgets/default_button.dart';

import '../../../../HomeScreen/view/HomeScreen.dart';
import '../../controller/cubit/creat_department_cubit.dart';

class CreateButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController nameController;
  // final TextEditingController managerController;
  const CreateButton(
      {super.key,
      required this.formkey,
      required this.nameController,
      // required this.managerController
      });

  @override
  Widget build(BuildContext context) {
    final creatDepartmentCubit = BlocProvider.of<CreatDepartmentCubit>(context);
    return BlocConsumer<CreatDepartmentCubit, CreatDepartmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultMaterialButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  creatDepartmentCubit.addDepatment(
                      name: nameController.text,
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
