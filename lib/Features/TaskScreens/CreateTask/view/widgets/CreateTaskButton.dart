import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/Widgets/default_button.dart';

import '../../controller/CreateTask/create_task_cubit.dart';


class CreateTaskButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final TextEditingController employeeIDController;
  final TextEditingController startDateController;
  final TextEditingController statusController;
  final TextEditingController endDateController;

  const CreateTaskButton({
    super.key,
    required this.formkey,
    required this.descriptionController,
    required this.titleController,
    required this.employeeIDController,
    required this.startDateController,
    required this.endDateController,
    required this.statusController,
  });
  @override
  Widget build(BuildContext context) {
    final createTaskCubit = BlocProvider.of<CreateTaskCubit>(context);
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultMaterialButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  createTaskCubit.addTask(
                    title: titleController.text,
                    description: descriptionController.text,
                    employeeID: employeeIDController.text,
                    startDate: createTaskCubit.cubitStartDate,
                    endDate: createTaskCubit.createEndDate,
                    status: statusController.text,
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                  // );
                } else {
                  Null;
                }
              },
              text: "CreateTask",
              fontSize: 16.sp,
              background: AppColors.primaryColor);
        });
  }
}
