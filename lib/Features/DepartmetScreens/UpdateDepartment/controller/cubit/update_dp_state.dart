part of 'update_dp_cubit.dart';

@immutable
sealed class UpdateDpState {}

final class UpdateDpInitial extends UpdateDpState {}

final class UpdateDpLoading extends UpdateDpState {}

final class UpdateDpSuccess extends UpdateDpState {}

final class UpdateDpFailed extends UpdateDpState {}
