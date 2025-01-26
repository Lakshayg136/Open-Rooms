import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/custom_field.dart';
import 'package:open_rooms/widgets/gradient_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  TextEditingController batchController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    uidController.dispose();
    batchController.dispose();
    super.dispose();
  }

  void signUpUser() async {}

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
            CustomField(controller: uidController, hintText: "College UID"),
            SizedBox(height: 20),
            CustomField(controller: batchController, hintText: "Batch"),
            SizedBox(height: 20),
            GradientButton(buttonText: 'Continue', onTap: () {})
          ],
        )),
      ),
    );
  }
}
