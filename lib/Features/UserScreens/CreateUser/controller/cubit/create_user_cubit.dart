import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import '../../model/CreateUserModel.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());

  static CreateUserCubit get(context) => BlocProvider.of(context);
  CreateUserModel? createUser;

  void addUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String usertype,
    // required String departmentid,
  }) async {
    emit(CreateUserLoading());
    DioHelper.postData(
      token: Const.userToken,
      url: Endpoints.createUser,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'user_type': groupValue,
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
      createUser = CreateUserModel.fromJson(value.data);
      print(createUser!.message);
      print(createUser!.data!.name);
      print(createUser!.data!.id);
      print(createUser!.data!.userType);
      emit(CreateUserSuccess());
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
      emit(CreateUserFailed());
    });
  }

  int groupValue = 0;

  void changeGroupValue({required int newValue}) {
    groupValue = newValue;
    emit(ChangeGroupValue());
  }
}
