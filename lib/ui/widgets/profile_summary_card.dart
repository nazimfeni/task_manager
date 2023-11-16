import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/edit_profile_screen.dart';
import 'package:task_manager/ui/screens/login_screen.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap == true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return EditProfileScreen();
          }));
        }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        fullName,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        AuthController.user?.email?? '',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () async {
            await AuthController.clearAuthData();
            // solve this worning
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (conetxt) => LoginScreen()),
                (route) => false);
          },
          icon: Icon(Icons.logout)),
      tileColor: Colors.green,
    );
  }
  String get fullName {
    return '${AuthController.user?.firstName ?? ''} ${AuthController.user?.lastName ?? ''}';
  }
}
