part of 'view_employees_cubit.dart';

@immutable
abstract class ViewEmpolyeesState {}

class ViewEmpolyeesIntial extends ViewEmpolyeesState {}

class ViewEmpolyeesLoading extends ViewEmpolyeesState {}

class ViewEmpolyeesLoaded extends ViewEmpolyeesState {
  
  final List<Employees>
      empolyees; // This property holds the department data

  ViewEmpolyeesLoaded({required this.empolyees});
}

class ViewEmpolyeesError extends ViewEmpolyeesState {
  final String errorMessage;

  ViewEmpolyeesError({this.errorMessage = 'Error loading data'});

  // You can customize the error message here if needed
}
