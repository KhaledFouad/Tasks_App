import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/DepartmetScreens/UpdateDepartment/view/widgets/UpdateButton.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';
import '../../GetAllDepartment/model/all_department_model.dart';
import 'widgets/form.dart';

class UpdateDpScreen extends StatefulWidget {
  // final int index;
  final DepartmentModel allDepartmentModel;
  const UpdateDpScreen(
      {super.key,
      // required this.index,
      required this.allDepartmentModel});

  @override
  State<UpdateDpScreen> createState() => _UpdateDpScreenState();
}

class _UpdateDpScreenState extends State<UpdateDpScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController managerIDController = TextEditingController();
  final TextEditingController departmentIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.allDepartmentModel.name!;
    managerIDController.text =
        widget.allDepartmentModel.manager!.id!.toString();
    departmentIdController.text = widget.allDepartmentModel.id!.toString();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.allDepartmentModel.id);
    print(widget.allDepartmentModel.name);
    print(widget.allDepartmentModel.manager!.id);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 100.sp),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              AppStrings.updatePDTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkColor,
                  fontSize: 34.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppStrings.updatePDSubTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                  fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            UpdateDpForm(
              formkey: formkey,
              managerIdController: managerIDController,
              nameController: nameController,
            ),
            UpdateButton(
              formkey: formkey,
              nameController: nameController,
              managerIdController: managerIDController,
              departmentIdController: departmentIdController,
            )
          ],
        ),
      ),
    );
  }
}
