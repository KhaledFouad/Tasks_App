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


import '../../../UpdateDepartment/view/UpdateDepartment.dart';
import '../../model/all_department_model.dart';

class CharacterItem extends StatelessWidget {
  final DepartmentModel character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpdateDpScreen(
                        allDepartmentModel: character,
                      )),
            );
          },
          child: GridTile(
            footer: Container(
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: GridTileBar(
                backgroundColor: Colors.grey,
                title: Text(
                  character.name ?? "Not Found",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                ),
                subtitle: Text(
                  character.id.toString() ?? "Not Found",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.5,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            child: Text(""),
          )),
    );
  }
}
