import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/Features/UserScreens/UpdateUser/view/widgets/UpdateButton.dart';
import 'package:tasks_app/Features/UserScreens/UpdateUser/view/widgets/form.dart';
import 'package:tasks_app/core/utils/AppColors.dart';
import 'package:tasks_app/core/utils/AppStrings.dart';
import '../../CreateUser/view/widgets/UserTypeWidget.dart';
import '../../GetAllUsers/model/all_user_model.dart';

class UpdateUserScreen extends StatefulWidget {
  final AllUserModel allUserModel;
  const UpdateUserScreen({super.key, required this.allUserModel});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final TextEditingController userIdController = TextEditingController();
  TextEditingController userTypeController = TextEditingController(text: "1");
  @override
  void initState() {
    nameController.text = widget.allUserModel.name!;
    emailController.text = widget.allUserModel.email!.toString();
    phoneController.text = widget.allUserModel.phone!.toString();
    // statusController.text = widget.allUserModel.status!;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.allUserModel.id);
    print(widget.allUserModel.name);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 100.sp),
        child: ListView(
          children: [
            Text(
              AppStrings.updateUserTitle,
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
              AppStrings.updateUserSubTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                  fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            UpdateUserForm(
              formkey: formkey,
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              phoneController: phoneController,
              idController: userIdController,
              userTypeController: userTypeController,
            ),
            const UserTypeGroup(),
            SizedBox(
              height: 20.h,
            ),
            UpdateUserButton(
              formkey: formkey,
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
              userIdController: userIdController,
              userTypeController: userTypeController,
            )
          ],
        ),
      ),
    );
  }
}
