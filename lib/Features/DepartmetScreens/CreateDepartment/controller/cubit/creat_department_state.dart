part of 'creat_department_cubit.dart';

@immutable
sealed class CreatDepartmentState {}

final class CreatDepartmentInitial extends CreatDepartmentState {}

final class CreatDepartmentLoading extends CreatDepartmentState {}

final class CreatDepartmentSuccess extends CreatDepartmentState {}

final class CreatDepartmentFailed extends CreatDepartmentState {}
