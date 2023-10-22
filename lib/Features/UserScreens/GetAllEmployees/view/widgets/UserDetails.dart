// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tasks_app/core/utils/AppColors.dart';
// import 'package:tasks_app/screens/GetAllDepartment/model/all_department_model.dart';

// class DepartmentCard extends StatelessWidget {

//   const DepartmentCard(
//       {super.key,
//       required this.allDepartmentModel,
//      });
//   final AllDepartmentModel allDepartmentModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(3.h),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 245, 245, 245),
//             borderRadius: BorderRadius.circular(8)),
//         height: 110.h,
//         width: 150.w,
//         child: Row(children: [
//           Container(
//             decoration: BoxDecoration(
//               color: AppColors.primaryColor,
//             ),
//             height: 75.h,
//             width: 2.w,
//           ),
//           SizedBox(
//             width: 4.5.w,
//           ),
//           // ListTile(title:  Text(
//           //       allDepartmentModel.id.toString()  ,
//           //       style: TextStyle(
//           //           color: Colors.black,
//           //           fontSize: 16.sp,
//           //           fontWeight: FontWeight.w700),
//           //     ),),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [

//               Text(
//                 allDepartmentModel.id.toString()  ,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(90, 196, 196, 196),
//                 ),
//                 child: Text(
//                   allDepartmentModel.name!,
//                   style: TextStyle(
//                       color: AppColors.primaryColor,
//                       fontSize: 9.sp,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.manage_accounts_rounded,
//                     color: AppColors.textColor,
//                     size: 17.sp,
//                   ),
//                   SizedBox(
//                     width: 4.w,
//                   ),
//                   Text(
//                    allDepartmentModel.manager!.id.toString(),
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:tasks_app/Features/UserScreens/GetAllEmployees/model/all_employees_model.dart';

class EmployeeItem extends StatelessWidget {
  final Employees userModel;

  const EmployeeItem({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Text(
      userModel.name!,
    );
  }
}
