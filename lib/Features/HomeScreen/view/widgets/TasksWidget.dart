import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/controller/cubit/get_tasks_cubit.dart';
import 'package:tasks_app/Features/TaskScreens/TasksPage/model/GetTasksModel.dart';

import 'package:tasks_app/Features/TaskScreens/TasksPage/view/widgets/TaskCard.dart';


class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTasksCubit>(context).tasksList();
  }

  GetTasksModel? allTasksModel;
  List<GetTasksModel> list3 = [];
  Widget viewTasks() {
    return BlocBuilder<GetTasksCubit, GetTasksState>(
      builder: (context, state) {
        if (state is ViewTasksLoaded) {
          list3 = state.tasks;
          return buildLoadedList();
        } else if (state is ViewTasksLoading) {
          return const CircularProgressIndicator();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget buildLoadedList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskCard(getTasksModel: list3[index]);
      },
      itemCount: list3.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  viewTasks();
  }
}
