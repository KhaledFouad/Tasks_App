// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasks_app/Features/DepartmetScreens/GetAllDepartment/Controller/cubit/view_department_cubit.dart';
// import 'package:tasks_app/Features/DepartmetScreens/GetAllDepartment/model/all_department_model.dart';
// import 'package:tasks_app/Features/UserScreens/GetAllEmployees/Controller/cubit/view_employees_cubit.dart';
// import 'package:tasks_app/Features/UserScreens/GetAllEmployees/model/all_employees_model.dart';
// import 'package:tasks_app/Features/UserScreens/UsersWidget/view/widgets/employeeCard.dart';

// class DepartmentWidgetd extends StatefulWidget {
//   const DepartmentWidgetd({super.key});

//   @override
//   State<DepartmentWidgetd> createState() => _DepartmentWidgetdState();
// }

// class _DepartmentWidgetdState extends State<DepartmentWidgetd> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<ViewEmployeesCubit>(context).usersList();
//     BlocProvider.of<ViewDepartmentCubit>(context).departmentList();
//   }


//   DepartmentModel? allDepartmentModel;
//   List<Employees> list3 = [];
//   List<DepartmentModel> list4 = [];

 

//   // Widget viewEmployees() {
//   //   return BlocBuilder<ViewEmployeesCubit, ViewEmpolyeesState>(
//   //     builder: (context, state) {
//   //       if (state is ViewEmpolyeesLoaded) {
//   //         list3 = state.empolyees;
//   //         return buildLoadedList2();
//   //       } else if (state is ViewEmpolyeesLoading) {
//   //         return const CircularProgressIndicator();
//   //       } else {
//   //         return const CircularProgressIndicator();
//   //       }
//   //     },
//   //   );
//   // }

//   // Widget buildLoadedList2() {
//   //   return ListView.builder(
//   //     itemBuilder: (context, index) {
//   //       return 
//   //     //   EmployeeCard(
//   //     //       // allDepartmentModel: list4[index],
//   //     //       getAllEmployeeModel: list3[index], departmentModel: null,);
//   //     },
//   //     // itemCount: list3.length,
//   //     // shrinkWrap: true,
//   //     // physics: const BouncingScrollPhysics(),
//   //     // padding: EdgeInsets.zero,
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return viewEmployees();
//   }
// }
