import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/AuthScreens/loginScreen/controller/cubit/login_cubit.dart';
import 'package:tasks_app/Features/HomeScreen/view/widgets/AddUserButton.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/view/TasksPage.dart';
import 'package:tasks_app/core/Widgets/AppBarListTile.dart';
import 'widgets/TabBar.dart';
import 'widgets/Drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
//  LoginModel? loginModel;

    return SafeArea(
        child: Scaffold(
            drawer: const Drawer(
              child: DrawerWidget(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
              child: Column(
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [AppBarListTile(), Spacer(), AddUserWidget()],
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                  const Expanded(
                    child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: TabBarWidget(),
                    ),
                  ),
                ],
              ),
            )));
  }
}
