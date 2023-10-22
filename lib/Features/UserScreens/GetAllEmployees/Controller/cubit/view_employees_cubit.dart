import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../EmployeeReo.dart';
import '../../model/all_employees_model.dart';
part 'view_employees_state.dart';

class ViewEmployeesCubit extends Cubit<ViewEmpolyeesState> {
  ViewEmployeesCubit(this.employeesRepositry) : super(ViewEmpolyeesIntial());

  static ViewEmployeesCubit get(context) => BlocProvider.of(context);

  final EmployeesRepositry employeesRepositry;

  List<Employees> list = [];

  List<Employees> usersList() {
    employeesRepositry.getEmployees().then((value) {
      emit(ViewEmpolyeesLoaded(empolyees: value));
      list = value;
      print(value.length);
    });
    // print(list);
    return list;
  }
}
