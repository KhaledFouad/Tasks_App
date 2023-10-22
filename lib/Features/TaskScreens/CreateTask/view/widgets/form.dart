import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/Widgets/default_form_field.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../controller/CreateTask/create_task_cubit.dart';

class CreateTaskForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final TextEditingController assignedEmployeeController;

  const CreateTaskForm(
      {super.key,
      required this.formkey,
      required this.descriptionController,
      required this.titleController,
      required this.assignedEmployeeController});

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  String dropdownvalue = 'Assigned Employee';
  String dropdownvalue2 = 'Assigned Department';

  // List of items in our dropdown menu
  var items = [
    'Assigned Employee',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
        builder: (context, state) {
      return Form(
        key: widget.formkey,
        child: Column(
          children: [
            DefaultFormField(
              controller: widget.titleController,
              keyboardType: TextInputType.name,
              labelText: "Title",
              radius: 10.sp,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your Title";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultFormField(
              maxLines: 50,
              height: 90.h,
              controller: widget.descriptionController,
              keyboardType: TextInputType.text,
              labelText: "Description",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please valid Description";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            // const CustomDropDownWidget(),
          ],
        ),
      );
    });
  }
}
