import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/model/GetTasksModel.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class TaskCard extends StatelessWidget {
  final GetTasksModel getTasksModel;

  const TaskCard({
    super.key,
    required this.getTasksModel,
  });

  Color setColor(String status) {
    if (status.toLowerCase() == 'new') {
      Color color = AppColors.primaryColor;
      return color;
    } else if (status.toLowerCase() == 'processing') {
      Color color = AppColors.processingColor;
      return color;
    } else if (status.toLowerCase() == 'completed') {
      Color color = Colors.green;
      return color;
    } else if (status.toLowerCase() == 'notcompleted') {
      Color color = AppColors.notCompletedColor;
      return color;
    } else if (status.toLowerCase() == 'expired') {
      Color color = Colors.red;
      return color;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
            //set border radius more than 50% of height and width to make circle
          ),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            height: 150.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getTasksModel.status!.toUpperCase() ?? "Not Found",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: setColor(getTasksModel.status!),
                      fontWeight: FontWeight.w400),
                ),
                const Divider(
                  thickness: 1.5,
                  color: Color.fromARGB(255, 222, 221, 221),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                      height: 50.h,
                      width: 3.5.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getTasksModel.name ?? "not found",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.darkColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.more_vert_rounded,
                              color: AppColors.textColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            getTasksModel.description ?? "not found",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: AppColors.textColor,
                      size: 20.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "starts ${getTasksModel.startDate ?? "not found"}  -  ends ${getTasksModel.endDate ?? "not found"}",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.darkColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
