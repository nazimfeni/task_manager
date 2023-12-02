import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/edit_profile_screen.dart';
import 'package:task_manager/ui/screens/login_screen.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    Key? key, // Added 'Key? key'
    this.enableOnTap = true,
  }) : super(key: key); // Fixed the super constructor call
  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    String? base64Image = AuthController.user?.photo;
    Uint8List? imageBytes;

    try {
      if (base64Image != null && base64Image.isNotEmpty) {
        imageBytes = base64Decode(base64Image);
      }
    } catch (e) {
      print("Error decoding base64 image: $e");
      // Handle the error accordingly, for instance, set a default image
      imageBytes = null; // Set to a default image or null
    }
    return ListTile(
      onTap: () {
        if (enableOnTap == true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return EditProfileScreen();
          }));
        }
      },
      leading: CircleAvatar(
        child: AuthController.user?.photo == null
            ? const Icon(Icons.person)
            : ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: imageBytes != null
              ? Image.memory(imageBytes!, fit: BoxFit.cover)
              : const Icon(Icons.error), // Display an error icon or placeholder
        ),
      ),
      title: Text(
        fullName,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        AuthController.user?.email ?? '',
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
