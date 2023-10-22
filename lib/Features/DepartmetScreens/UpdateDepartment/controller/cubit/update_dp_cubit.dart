import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/core/constants/EndPoints.dart';
import 'package:tasks_app/core/constants/const.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import '../../model/UpdateDPModel.dart';

part 'update_dp_state.dart';

class UpdateDpCubit extends Cubit<UpdateDpState> {
  UpdateDpCubit() : super(UpdateDpInitial());

  static UpdateDpCubit get(context) => BlocProvider.of(context);
  UpdateDPModel? updateDPModel;
  void updateDepartment(
      {required String newName,
      required String departmentId,
      required String newManagerId,
      String? token}) async {
    emit(UpdateDpLoading());

    try {
      final response = await DioHelper.postData(
        url: "${Endpoints.updateDP}$departmentId",
        data: {
          'name': newName,
          'manager_id': newManagerId,
        },
        token: Const.userToken,
      );

      if (response.statusCode == 200) {
        updateDPModel = UpdateDPModel.fromJson(response.data);
        emit(UpdateDpSuccess());
      } else {
        emit(UpdateDpFailed());
      }
    } catch (e) {
      emit(UpdateDpFailed());
      print(e);
    }
  }
}
