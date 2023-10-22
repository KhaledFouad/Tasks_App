part of 'get_tasks_cubit.dart';

@immutable
sealed class GetTasksState {}

final class GetTasksInitial extends GetTasksState {}
class ViewTasksLoading extends GetTasksState {}

class ViewTasksLoaded extends GetTasksState {
  final List<GetTasksModel> tasks; // This property holds the users data

  ViewTasksLoaded({required this.tasks});
}

class ViewTasksError extends GetTasksState {
  final String errorMessage;

  ViewTasksError({this.errorMessage = 'Error loading data'});

  // You can customize the error message here if needed
}
