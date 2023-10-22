import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/Features/UserScreens/GetAllUsers/Controller/cubit/view_users_cubit.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import '../model/all_user_model.dart';
import 'widgets/UserDetails.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ViewUsersCubit>(context).usersList();
  }

  AllUserModel? allUserModel;
  List<AllUserModel> list1 = [];
  Widget viewUsers() {
    return BlocBuilder<ViewUsersCubit, ViewUsersState>(
      builder: (context, state) {
        if (state is ViewUsersLoaded) {
          list1 = state.users;
          // print(list);
          print("****************");
          return buildLoadedList();
        } else if (state is ViewUsersLoading) {
          return const CircularProgressIndicator();
        } else {
          return const CircularProgressIndicator();
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
        return UserItem(
          userModel: list1[index],
        );
      },
      itemCount: list1.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: viewUsers(),
    );
  }
}
