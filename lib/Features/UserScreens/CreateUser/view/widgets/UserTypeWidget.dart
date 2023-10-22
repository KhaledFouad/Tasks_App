import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../controller/cubit/create_user_cubit.dart';

class UserTypeGroup extends StatelessWidget {
  const UserTypeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColor),
                  borderRadius: BorderRadius.circular(4.w)),
              child: RadioMenuButton(
                value: 0,
                groupValue: CreateUserCubit.get(context).groupValue,
                onChanged: (value) {
                  CreateUserCubit.get(context)
                      .changeGroupValue(newValue: value!);
                },
                child: Text(
                  'Admin',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              height: 25.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColor),
                  borderRadius: BorderRadius.circular(4.w)),
              child: RadioMenuButton(
                value: 1,
                groupValue: CreateUserCubit.get(context).groupValue,
                child: Text(
                  'Manager',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                onChanged: (value) {
                  CreateUserCubit.get(context)
                      .changeGroupValue(newValue: value!);
                },
              ),
            ),
            Container(
              height: 25.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textColor),
                  borderRadius: BorderRadius.circular(4.w)),
              child: RadioMenuButton(
                value: 2,
                groupValue: CreateUserCubit.get(context).groupValue,
                child: Text(
                  'Employee',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
                onChanged: (value) {
                  CreateUserCubit.get(context)
                      .changeGroupValue(newValue: value!);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}