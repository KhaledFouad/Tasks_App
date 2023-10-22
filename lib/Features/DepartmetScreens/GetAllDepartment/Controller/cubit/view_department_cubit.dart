import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../DepartmentRepo.dart';
import '../../model/all_department_model.dart';
part 'view_department_state.dart';

class ViewDepartmentCubit extends Cubit<ViewDepartmentState> {
  ViewDepartmentCubit(this.departmentRepo) : super(ViewDepartmentIntial());

  static ViewDepartmentCubit get(context) => BlocProvider.of(context);

  final DepartmentRepositry departmentRepo;

  List<DepartmentModel> list = [];

  List<DepartmentModel> departmentList() {
    departmentRepo.getDepartments().then((value) {
      print(" in cubit/////////////////////");
      emit(ViewDepartmentLoaded(departments: value));
      list = value;
       print(value.length);
    });
    // print(list);
    return list;
  }
}
