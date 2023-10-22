import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import '../Controller/cubit/view_department_cubit.dart';
import '../model/all_department_model.dart';
import 'widgets/DepartmentDetails.dart';

class AllDepartment extends StatefulWidget {
  const AllDepartment({super.key});

  @override
  State<AllDepartment> createState() => _AllDepartmentState();
}

class _AllDepartmentState extends State<AllDepartment> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ViewDepartmentCubit>(context).departmentList();
  }

  DepartmentModel? allDepartmentModel;
  List<DepartmentModel> list = [];
  Widget viewDepartment() {
    return BlocBuilder<ViewDepartmentCubit, ViewDepartmentState>(
      builder: (context, state) {
        if (state is ViewDepartmentLoaded) {
          list = state.departments;
          // print(list);
          print("****************");
          return buildLoadedList();
        } else if (state is ViewDepartmentLoading) {
          return CircularProgressIndicator();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget buildLoadedList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return CharacterItem(
          character: list[index],
        );
      },
      itemCount: list.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.darkColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
     
      body: viewDepartment(),
    );
  }
}
