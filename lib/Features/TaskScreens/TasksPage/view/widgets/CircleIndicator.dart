import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

class CircularProgressGroupItem extends StatelessWidget {
  const CircularProgressGroupItem(
      {Key? key,
      required this.percent,
      this.radius,
      required this.center,
      required this.progressColor,
      required this.backgroundColor})
      : super(key: key);

  final double percent;
  final double? radius;
  final String center;

  final Color progressColor;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          radius: radius ?? 30.sp,
          percent: percent,
          lineWidth: 5.sp,
          center: Text(
            center,
            style: TextStyle(
                color: AppColors.darkColor,
                fontSize: 8.sp,
                fontWeight: FontWeight.w900),
          ),
          progressColor: progressColor,
          backgroundColor: backgroundColor,
        ),
        SizedBox(
          width: 0.5.w,
        )
      ],
    );
  }
}
