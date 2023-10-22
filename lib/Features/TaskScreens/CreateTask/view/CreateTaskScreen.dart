import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';
import '../../../UserScreens/GetAllEmployees/view/widgets/CustomDropDownWidget.dart';
import '../controller/CreateTask/create_task_cubit.dart';
import 'widgets/CreateTaskButton.dart';
import 'widgets/dateRangePicker.dart';
import 'widgets/form.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController(text: "Test");
  TextEditingController descriptionController =
      TextEditingController(text: "test ");
  TextEditingController assignedEmployeeController =
      TextEditingController(text: "3");
  TextEditingController startDateController =
      TextEditingController(text: "2024/01/01");
  TextEditingController statusController = TextEditingController(text: '0');
  TextEditingController endDateController =
      TextEditingController(text: "2024/01/02");
  // @override
  // void initState() {
  //   nameController.text = widget.datePicker.;
  //   managerIDController.text =
  //       widget.allDepartmentModel.manager!.id!.toString();
  //   departmentIdController.text = widget.allDepartmentModel.id!.toString();
  // }

  @override
  Widget build(BuildContext context) {
    final createTaskCubit = BlocProvider.of<CreateTaskCubit>(context);
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 50.sp),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    AppStrings.createTaskTitle,
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
                    AppStrings.createTaskSubTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const DatePicker(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CreateTaskForm(
                    formkey: formkey,
                    titleController: titleController,
                    assignedEmployeeController: assignedEmployeeController,
                    descriptionController: descriptionController,
                  ),
                  const CustomDropDownWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CreateTaskButton(
                    formkey: formkey,
                    descriptionController: descriptionController,
                    titleController: titleController,
                    employeeIDController: assignedEmployeeController,
                    startDateController: startDateController,
                    endDateController: endDateController,
                    statusController: statusController,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
