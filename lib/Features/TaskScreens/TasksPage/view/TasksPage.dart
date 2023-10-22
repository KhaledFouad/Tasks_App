import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_app/Features/HomeScreen/view/widgets/Drawer.dart';
import 'package:tasks_app/Features/HomeScreen/view/widgets/TasksWidget.dart';
import '../../../../core/Widgets/AppBarListTile.dart';
import 'widgets/CircleIndicator.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const AppBarListTile(),
                      const Spacer(),
                      Row(
                        children: [
                          CircularProgressGroupItem(
                            percent: 0.5,
                            center: '9/20',
                            progressColor: Color(0xff94C68D),
                            backgroundColor: Color(0xff94C68D).withOpacity(0.4),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: CircularProgressGroupItem(
                              percent: 0.25,
                              center: '5/20',
                              progressColor: Colors.orangeAccent,
                              backgroundColor:
                                  Colors.orangeAccent.withOpacity(0.4),
                            ),
                          ),
                          CircularProgressGroupItem(
                            percent: 0.33333,
                            center: '6/20',
                            progressColor: Colors.redAccent,
                            backgroundColor: Colors.redAccent.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  DatePicker(
                    DateTime.now(),
                    height: 80.h,
                    width: 60.w,
                    initialSelectedDate: DateTime.now(),
                    selectedTextColor: Colors.white,
                    selectionColor: Colors.deepPurple,
                    onDateChange: (newDate) {},
                    dayTextStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    dateTextStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    monthTextStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
              const TasksWidget()
            ],
          ),
        ),
      ),
    );
  }
}
