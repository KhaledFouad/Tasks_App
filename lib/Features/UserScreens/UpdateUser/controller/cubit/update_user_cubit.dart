import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import '../../model/UpdateUserModel.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit() : super(UpdateUserInitial());

  static UpdateUserCubit get(context) => BlocProvider.of(context);
  UpdateUserModel? updateUserModel;
  void updateUser(
      {required String newName,
      required String newEmail,
      required String newPhone,
      // required String newPassword,
      required String newUserType,
      String? newUserStatus,
      required String usertId,
      String? token}) async {
    emit(UpdateUserLoading());

    try {
      final response = await DioHelper.postData(
        url: "${Endpoints.updateUser}$usertId",
        data: {
          'name': "diaa",
          'email': "dada11@gmail.com",
          'phone': "00004400000",
          // 'password': newPassword,
          'user_type': groupValue,
          'user_status': "0"

          // 'manager_id': newManagerId,
        },
        token: Const.userToken,
      );

      if (response.statusCode == 200) {
        updateUserModel = UpdateUserModel.fromJson(response.data);
        emit(UpdateUserSuccess());
      } else {
        emit(UpdateUserFailed());
      }
    } catch (e) {
      if (e is DioError) {}
      emit(UpdateUserFailed());

      print(e);
    }
  }

  int groupValue = 0;

  void changeGroupValue({required int newValue}) {
    groupValue = newValue;
    emit(ChangeGroupValue2());
  }
}
