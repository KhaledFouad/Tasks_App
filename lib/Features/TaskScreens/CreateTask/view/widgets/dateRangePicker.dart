import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:intl/intl.dart';

import '../../controller/CreateTask/create_task_cubit.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String _selectedDate = '';
  String startDate = '';
  String endDate = '';
  String _dateCount = '';

  @override
  Widget build(BuildContext context) {
    var createTaskcubit = CreateTaskCubit.get(context);
    return Center(
      child: Container(
          // margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 60),
          width: double.infinity,
          height: 300,
          padding: EdgeInsets.all(3.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.textColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: SfDateRangePicker(
              view: DateRangePickerView.month,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              rangeSelectionColor: Color.fromARGB(255, 224, 194, 229),
              startRangeSelectionColor: AppColors.primaryColor,
              endRangeSelectionColor: AppColors.primaryColor,
              selectionRadius: 30.sp,
              selectionShape: DateRangePickerSelectionShape.circle,
              todayHighlightColor: AppColors.primaryColor,
              selectionColor: AppColors.primaryColor,
              onSubmit: (val) {
                if (val is PickerDateRange) {
                  startDate = DateFormat('yyyy/MM/dd').format(val.startDate!);
                  endDate = DateFormat('yyyy/MM/dd').format(val.endDate!);
                  createTaskcubit.cubitStartDate = startDate;
                  createTaskcubit.createEndDate = endDate;

                  // _range =
                  //     '${DateFormat('dd/MM/yyyy').format(val.startDate!)} -'
                  //     ' ${DateFormat('dd/MM/yyyy').format(val.endDate ?? val.startDate!)}';
                } else if (val is DateTime) {
                  _selectedDate = val.toString();
                } else if (val is List<DateTime>) {
                  _dateCount = val.length.toString();
                } else {
                  //_rangeCount = val.length.toString();
                }
                // print(startDate);
                print(createTaskcubit.cubitStartDate);
                print(endDate);

                print(_selectedDate);
                print(_dateCount);
              },
              onCancel: () {})),
    );
  }
}
