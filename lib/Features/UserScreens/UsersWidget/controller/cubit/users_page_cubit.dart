import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'users_page_state.dart';

class UsersPageCubit extends Cubit<UsersPageState> {
  UsersPageCubit() : super(UsersPageInitial());
  static UsersPageCubit get(context) => BlocProvider.of(context);
}
