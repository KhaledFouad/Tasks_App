import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/UserScreens/UsersWidget/view/widgets/DPname.dart';
import 'package:tasks_app/Features/UserScreens/UsersWidget/view/widgets/departmentwidget.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 5.h,
        ),
       
        // const DepartmentWidgetd(),
      ],
    );
  }
}
