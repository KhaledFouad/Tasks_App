import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

import 'model/all_employees_model.dart';


class EmployeesRepositry {
  final DioHelper dioHelper;

  EmployeesRepositry({required this.dioHelper});

  Future<List<Employees>> getEmployees() async {
    final data = await dioHelper.getEmployees();
    print(data);
    print("in repooooo");

    // return data.map((e) => );
    // print(data.map((e) => AllDepartmentModel.fromJson(e)).toList());
    return data.map((e) => Employees.fromJson(e)).toList();
  }
}
