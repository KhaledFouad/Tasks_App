import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';


import 'model/all_department_model.dart';

class DepartmentRepositry {
  final DioHelper dioHelper;

  DepartmentRepositry({required this.dioHelper});

  Future<List<DepartmentModel>> getDepartments() async {
    final data = await dioHelper.getDapartments();
    print(data);
    print("in repooooo");
    
    // return data.map((e) => );
    // print(data.map((e) => AllDepartmentModel.fromJson(e)).toList());
    return data.map((e) => DepartmentModel.fromJson(e)).toList();
  }
}
