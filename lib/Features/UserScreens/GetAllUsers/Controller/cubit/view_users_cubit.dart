import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../UsersReo.dart';
import '../../model/all_user_model.dart';
part 'view_users_state.dart';

class ViewUsersCubit extends Cubit<ViewUsersState> {
  ViewUsersCubit(this.usersRepositry) : super(ViewUsersIntial());

  static ViewUsersCubit get(context) => BlocProvider.of(context);

  final UsersRepositry usersRepositry;

  List<AllUserModel> list = [];

  List<AllUserModel> usersList() {
    usersRepositry.getUsers().then((value) {
      emit(ViewUsersLoaded(users: value));
      list = value;
      print(value.length);
    });
    // print(list);
    return list;
  }
}
