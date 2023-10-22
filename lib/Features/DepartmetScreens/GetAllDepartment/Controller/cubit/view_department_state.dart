part of 'view_department_cubit.dart';

@immutable
abstract class ViewDepartmentState {}

class ViewDepartmentIntial extends ViewDepartmentState {}
class ViewDepartmentLoading extends ViewDepartmentState {}

class ViewDepartmentLoaded extends ViewDepartmentState {
  final List<DepartmentModel> departments; // This property holds the department data

  ViewDepartmentLoaded({required this.departments});
}

class ViewDepartmentError extends ViewDepartmentState {
  final String errorMessage;

  ViewDepartmentError({this.errorMessage = 'Error loading data'});

  // You can customize the error message here if needed
}
