import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/DepartmetScreens/GetAllDepartment/model/all_department_model.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class EmployeeCard extends StatelessWidget {
   final DepartmentModel departmentModel;

  const EmployeeCard(
      {super.key,
      // required this.allDepartmentModel,
     required this.departmentModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.h),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.textColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        height: 110.h,
        width: 150.w,
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            height: 75.h,
            width: 2.w,
          ),
          SizedBox(
            width: 4.5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                departmentModel.name!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(90, 196, 196, 196),
                ),
                child: Text(
                  departmentModel.employees![1].name!,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: AppColors.textColor,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  // Text(
                  //   allDepartmentModel.email!,
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 10.sp,
                  //       fontWeight: FontWeight.w400),
                  // ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    color: AppColors.textColor,
                    size: 17.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  // Text(
                  //   allDepartmentModel.phone!.toString(),
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 10.sp,
                  //       fontWeight: FontWeight.w400),
                  // ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
