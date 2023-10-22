import 'package:tasks_app/Features/TaskScreens/TasksPage/model/GetTasksModel.dart';
import 'package:tasks_app/core/data_provider/remote/dioHelper.dart';

class TasksRepositry {
  final DioHelper dioHelper;

  TasksRepositry({required this.dioHelper});

  Future<List<GetTasksModel>> getAllTasks() async {
    final data = await dioHelper.getTasks();
    print(data);

    // return data.map((e) => );
    // print(data.map((e) => AllDepartmentModel.fromJson(e)).toList());
    return data.map((e) => GetTasksModel.fromJson(e)).toList();
  }
}
