// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:open_rooms/resources/auth/auth_controller.dart';
import 'package:open_rooms/resources/user_profile/user_profile_controller.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/custom_field.dart';
import 'package:open_rooms/widgets/gradient_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  final String uid;
  const SignUpScreen({required this.uid, super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  // TextEditingController uidController = TextEditingController();
  TextEditingController batchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: ref.read(userProvider)!.name);
    batchController =
        TextEditingController(text: ref.read(userProvider)!.batch);
  }

  @override
  void dispose() {
    nameController.dispose();
    batchController.dispose();
    super.dispose();
  }

  void saveProfile() {
    ref.read(userProfileControllerProvider.notifier).editProfile(
        name: nameController.text.trim(),
        context: context,
        batch: batchController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 50),
            Image.asset(
              'assets/logo.png',
            ),
            SizedBox(height: 20),
            CustomField(controller: nameController, hintText: "Full Name"),
            SizedBox(height: 20),
            // CustomField(controller: uidController, hintText: "College UID"),
            // SizedBox(height: 20),
            CustomField(
                controller: batchController, hintText: "Batch (Example: 401A)"),
            SizedBox(height: 20),
            GradientButton(buttonText: 'Continue', onTap: saveProfile)
          ],
        )),
      ),
    );
  }
}
