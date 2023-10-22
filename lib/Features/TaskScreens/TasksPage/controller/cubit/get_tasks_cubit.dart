import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/TasksRepo.dart';

import '../../model/GetTasksModel.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit(this.tasksRepositry) : super(GetTasksInitial());

  static GetTasksCubit get(context) => BlocProvider.of(context);

  final TasksRepositry tasksRepositry;

  List<GetTasksModel> list = [];
  

   

  List<GetTasksModel> tasksList() {
    tasksRepositry.getAllTasks().then((value) {
      emit(ViewTasksLoaded(tasks: value));
      list = value;
      print(value.length);
    });
    // print(list);
    return list;
  }
}
