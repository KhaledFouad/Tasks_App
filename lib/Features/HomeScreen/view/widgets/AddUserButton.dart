import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/AuthScreens/loginScreen/controller/cubit/login_cubit.dart';
import 'package:tasks_app/Features/DepartmetScreens/CreateDepartment/view/CreateDepartment.dart';
import 'package:tasks_app/Features/TaskScreens/CreateTask/view/CreateTaskScreen.dart';
import 'package:tasks_app/Features/UserScreens/CreateUser/view/CreateUser.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return PopupMenuButton(
            iconSize: 40.sp,
            // elevation: 0,
            // position: PopupMenuPosition.values,
            shadowColor: AppColors.primaryColor,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateUser()),
                    );
                  },
                  child: const Center(
                    child: Column(
                      children: [
                        Text(
                          "employee",
                        ),
                        Text(
                          "_____________",
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 214, 214),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              loginCubit.userType == "admin"
                  ? PopupMenuItem(
                      value: 1,
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateUser()),
                          );
                        },
                        child: const Center(
                          child: Column(
                            children: [
                              Text(
                                "employee",
                              ),
                              Text(
                                "_____________",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : PopupMenuItem(
                      height: 2,
                      value: 1,
                      child: InkWell(
                        onTap: () {},
                        child: const Center(child: SizedBox()),
                      ),
                    ),
              PopupMenuItem(
                value: 3,
                height: 30,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateTaskScreen()),
                  );
                },
                child: Center(
                  child: Text(
                    "task",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ],
            icon: Container(
              height: 65.h,
              width: 60.w,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35.sp,
              ),
            ),
            offset: const Offset(0, 100),
          );
        });
  }
}



// InkWell(
//       onTap: () {},
//       child: Container(
//         padding: const EdgeInsets.all(1),
//         decoration: BoxDecoration(
//           color: AppColors.primaryColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//           size: 35.sp,
//         ),
//       ),
    // );