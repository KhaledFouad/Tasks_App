import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import 'model/all_user_model.dart';


class UsersRepositry {
  final DioHelper dioHelper;

  UsersRepositry({required this.dioHelper});

  Future<List<AllUserModel>> getUsers() async {
    final data = await dioHelper.getUsers();
    print(data);
    print("in repooooo");

    // return data.map((e) => );
    // print(data.map((e) => AllDepartmentModel.fromJson(e)).toList());
    return data.map((e) => AllUserModel.fromJson(e)).toList();
  }
}
