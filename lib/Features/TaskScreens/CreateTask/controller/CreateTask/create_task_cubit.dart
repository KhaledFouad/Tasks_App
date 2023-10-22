import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/Features/UserScreens/CreateUser/controller/cubit/create_user_cubit.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import '../../model/CreateTaskModel.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  CreateTaskCubit() : super(CreateTaskInitial());
  static CreateTaskCubit get(context) => BlocProvider.of(context);
  CreateTaskModel? createTaskModel;
  String cubitStartDate = "";
  String createEndDate = "";
  final formKey = GlobalKey<FormState>();
  void addTask({
    required String title,
    required String description,
    required String employeeID,
    required String startDate,
    required String endDate,
    required String status, // required String departmentid,
    // required String departmentid,
  }) async {
    emit(CreateTaskLoading());
    DioHelper.postData(
      token: Const.userToken,
      url: Endpoints.createTask,
      data: {
        'name': title,
        'description': description,
        'status': status,
        'start_date': startDate,
        'end_date': endDate,
        'employee_id': dropdownValue,

        // 'department_id': departmentid
      },

      // token: Endpoints.userToken
    ).then((value) {
      Fluttertoast.showToast(
          msg: "Creation Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp);
      createTaskModel = CreateTaskModel.fromJson(value.data);
      print(createTaskModel!.message);
      print(createTaskModel!.data!.name);
      print(createTaskModel!.data!.description);
      print(createTaskModel!.data!.startDate);
      print(createTaskModel!.data!.endDate);
      print(createTaskModel!.data!.status);
      // print(createTaskModel!.data!.userType);
      emit(CreateTaskSuccess());
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Creattion Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(error.toString());
      emit(CreateTaskFailed());
    });
  }
    String? dropdownValue;

  void changeDropdownValue({required dynamic value}) {
    dropdownValue = value.id.toString();
    emit(ChangeDropdownValueState());
  }

}
