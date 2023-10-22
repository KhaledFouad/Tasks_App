import 'package:flutter/material.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/view/TasksPage.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/local/cache_helper.dart';
import '../../../AuthScreens/loginScreen/view/LoginScreen.dart';
import '../../../DepartmetScreens/CreateDepartment/view/CreateDepartment.dart';
import '../../../DepartmetScreens/GetAllDepartment/view/All_DP.dart';
import '../../../TaskScreens/CreateTask/view/CreateTaskScreen.dart';
import '../../../UserScreens/CreateUser/view/CreateUser.dart';
import '../../../UserScreens/GetAllUsers/view/All_users.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Text("Hello "),
        ),
        ListTile(
          leading: const Icon(
            Icons.add,
            color: Colors.orange,
          ),
          title: const Text('Add New User'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateUser()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.add_box_outlined,
            color: Colors.green,
          ),
          title: const Text('Add New Department'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateDepartmentScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.plus_one,
            color: Colors.purple,
          ),
          title: const Text('Add New Task'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateTaskScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.view_agenda,
            color: Colors.blue,
          ),
          title: const Text('View All Departments'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllDepartment()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.view_agenda,
            color: Colors.blue,
          ),
          title: const Text('View All Users'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllUsers()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: const Text('logout'),
          onTap: () {
            CacheHelper.clearData(
              key: 'token',
            ).then((value) {
              Const.userType = "";
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const LoginScreen(),
                ),
              );
            });
          },
        )
      ],
    );
  }
}
