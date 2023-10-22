part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class EmailValidState extends LoginState {}

class PasswordValidState extends LoginState {}

class ChangeCheckState extends LoginState {}
