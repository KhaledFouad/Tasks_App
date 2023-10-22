import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';


import '../../model/CreateDepratment.dart';

part 'creat_department_state.dart';

class CreatDepartmentCubit extends Cubit<CreatDepartmentState> {
  CreatDepartmentCubit() : super(CreatDepartmentInitial());

  static CreatDepartmentCubit get(context) => BlocProvider.of(context);
  CreateDepartmentModel? createDepartment;

  void addDepatment({
    required String name,
   
  }) async {
    emit(CreatDepartmentLoading());
    DioHelper.postData(
      token: Const.userToken,
      url: Endpoints.createDepartment,
      data: {
        'name': name,
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
      createDepartment = CreateDepartmentModel.fromJson(value.data);
      print(createDepartment!.message);
      print(createDepartment!.data!.name);
      print(createDepartment!.data!.id);
      print(createDepartment!.data!.manager);
      emit(CreatDepartmentSuccess());
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
      emit(CreatDepartmentFailed());
    });
  }
}
