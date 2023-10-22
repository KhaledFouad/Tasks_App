
import 'package:flutter/material.dart';
import '../../../UpdateUser/view/UpdateUser.dart';
import '../../model/all_user_model.dart';

class UserItem extends StatelessWidget {
  final AllUserModel userModel;

  const UserItem({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UpdateUserScreen(
                      allUserModel: userModel,
                    )),
          );
        },
        child: Container(
       
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: ListTile(
            title: Text(
              userModel.name ?? "Not Found",
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.5,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
            subtitle: Text(
              userModel.id.toString() ?? "Not Found",
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.5,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
