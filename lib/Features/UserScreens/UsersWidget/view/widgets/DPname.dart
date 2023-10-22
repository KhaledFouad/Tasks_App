import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/UserScreens/GetAllEmployees/model/all_employees_model.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class DPname extends StatelessWidget {
    final Employees allDepartmentModel;

  const DPname({super.key, required this.allDepartmentModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: AppColors.textColor,
          width: 60.w,
          height: 1.3.h,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          allDepartmentModel.name!,
          style: TextStyle(color: AppColors.textColor, fontSize: 13.sp),
        ),
        // SizedBox(
        //   width: 1.w,
        // ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit_note_rounded,
            color: AppColors.textColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }
}
