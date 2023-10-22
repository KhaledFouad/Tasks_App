part of 'view_users_cubit.dart';

@immutable
abstract class ViewUsersState {}

class ViewUsersIntial extends ViewUsersState {}

class ViewUsersLoading extends ViewUsersState {}

class ViewUsersLoaded extends ViewUsersState {
  final List<AllUserModel> users; // This property holds the users data

  ViewUsersLoaded({required this.users});
}

class ViewUsersError extends ViewUsersState {
  final String errorMessage;

  ViewUsersError({this.errorMessage = 'Error loading data'});

  // You can customize the error message here if needed
}
