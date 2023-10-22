import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/TaskScreens/CreateTask/controller/CreateTask/create_task_cubit.dart';
import 'package:tasks_app/Features/UserScreens/GetAllEmployees/Controller/cubit/view_employees_cubit.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  void initState() {
    ViewEmployeesCubit.get(context).usersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTaskCubit, CreateTaskState>(
      builder: (context, state) {
        return BlocBuilder<ViewEmployeesCubit, ViewEmpolyeesState>(
          builder: (context, state) {
            if (state is ViewEmpolyeesLoaded) {
              return Form(
                key: CreateTaskCubit.get(context).formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      border: Border.all(color: AppColors.textColor, width: 1)),
                  child: DropdownButtonFormField(
                    validator: (value) =>
                        value == null ? 'Please assigned employee' : null,
                    decoration: InputDecoration(
                      // fillColor: AppColors.textColor,
                      // filled: true,
                      isDense: true,
                      helperStyle: TextStyle(color: AppColors.darkColor),
                      labelStyle: TextStyle(color: AppColors.darkColor),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.w),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(8.w),
                    hint: Text(
                      'Assigned Employee',
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColors.darkColor),
                    ),
                    items: state.empolyees
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e.name!),
                            ))
                        .toList(),
                    onChanged: (value) {
                      CreateTaskCubit.get(context)
                          .changeDropdownValue(value: value);
                    },
                  ),
                ),
              );
            } else if (state is ViewEmpolyeesError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
