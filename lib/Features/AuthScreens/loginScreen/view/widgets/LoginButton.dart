import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/AuthScreens/loginScreen/model/loginModel.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/view/TasksPage.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/Widgets/default_button.dart';

import '../../../../HomeScreen/view/HomeScreen.dart';
import '../../controller/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButton(
      {super.key,
      required this.formkey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultMaterialButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  loginCubit
                      .userLogin(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) {
                    print(loginCubit.userType);
                    if (loginCubit.userType == "employee") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TasksPage(
                                //  userType:LoginCubit.get(context).dataModel.userType!,
                                )),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                //  userType:LoginCubit.get(context).dataModel.userType!,
                                )),
                      );
                    }
                  });
                }
              },
              text: "Login",
              fontSize: 16.sp,
              background: AppColors.primaryColor);
        });
  }
}
