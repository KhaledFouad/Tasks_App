import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import '../../model/loginModel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  String? userType;
  bool isChecked = false;
  // Data dataModel = Data();
  LoginModel? loginModel;

  void changeCheck({required bool value}) {
    isChecked = value;
    emit(ChangeCheckState());
  }

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await DioHelper.postData(
        url: Endpoints.login,
        data: {
          'email': email,
          'password': password,
        },

        // token: Endpoints.userToken
      );
      Map<String, dynamic> data = response.data;
      emit(LoginSuccessState());

      loginModel = LoginModel.fromJson(data);
      Const.userToken = loginModel!.data!.token;

      userType = loginModel!.data!.userType;

      print(loginModel!.data!.email);
      print(userType);
      print(loginModel!.data!.token);
  
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Login Failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e.toString());
      emit(LoginErrorState());
    }
  }
}
