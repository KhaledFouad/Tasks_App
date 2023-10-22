import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/core/Widgets/default_form_field.dart';
import 'package:tasks_app/core/utils/AppColors.dart';

import '../../controller/cubit/update_dp_cubit.dart';

class UpdateDpForm extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController? managerIdController;
  final TextEditingController nameController;

  const UpdateDpForm(
      {super.key,
      required this.formkey,
      required this.managerIdController,
      required this.nameController});

  @override
  State<UpdateDpForm> createState() => _CreateDpFormState();
}

class _CreateDpFormState extends State<UpdateDpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateDpCubit, UpdateDpState>(builder: (context, state) {
      return Form(
        key: widget.formkey,
        child: Column(
          children: [
            DefaultFormField(
              controller: widget.nameController,
              keyboardType: TextInputType.name,
              labelText: "Name",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            DefaultFormField(
              controller: widget.managerIdController!,
              keyboardType: TextInputType.number,
              labelText: "Manager ID",
              radius: 10,
              labelColor: AppColors.darkColor,
              textColor: AppColors.darkColor,
              cursorColor: Colors.white,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please valid manager Id";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      );
    });
  }
}
