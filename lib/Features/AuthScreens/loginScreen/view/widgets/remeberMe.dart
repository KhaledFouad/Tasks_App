import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';

import '../../controller/cubit/login_cubit.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Row(
        children: [
          Checkbox(
              activeColor: AppColors.primaryColor,
              value: LoginCubit.get(context).isChecked,
              onChanged: (value) {
                LoginCubit.get(context).changeCheck(value: value!);
              }),
          // Checkbox(

          Text(
            AppStrings.loginMessage3,
            style: TextStyle(
                color: AppColors.darkColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          )
        ],
      );
    });
  }
}
