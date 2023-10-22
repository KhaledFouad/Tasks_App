import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/HomeScreen/view/widgets/TasksWidget.dart';
import 'package:tasks_app/Features/UserScreens/UsersWidget/view/UsersPage.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
          width: 200.w,
          child: TabBar(
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.darkColor,
              indicatorColor: AppColors.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: AppColors.textColor,
              // isScrollable: true,
              // overlayColor: MaterialStatePropertyAll(Colors.red),
              mouseCursor: SystemMouseCursors.basic,
              unselectedLabelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              labelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              tabs: const [
                Row(
                  children: [
                    Icon(Icons.person_2_outlined),
                    Text('Users'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.task),
                    Text('Tasks'),
                  ],
                ),
              ]),
        ),
        const SizedBox(
          height: 10,
        ),
        const Flexible(
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              UsersPage(),
              TasksWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
