import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/Widgets/default_button.dart';

import '../../../../HomeScreen/view/HomeScreen.dart';
import '../../controller/cubit/update_dp_cubit.dart';

class UpdateButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController managerIdController;
  final TextEditingController nameController;
  final TextEditingController departmentIdController;

  const UpdateButton(
      {super.key,
      required this.formkey,
      required this.managerIdController,
      required this.nameController,
      required this.departmentIdController});
  @override
  Widget build(BuildContext context) {
    final updateDpCubit = BlocProvider.of<UpdateDpCubit>(context);
    return BlocConsumer<UpdateDpCubit, UpdateDpState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultMaterialButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  updateDpCubit.updateDepartment(
                    departmentId: departmentIdController.text,
                    newManagerId: managerIdController.text,
                    newName: nameController.text,
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
