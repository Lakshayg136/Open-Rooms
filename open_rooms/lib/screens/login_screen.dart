import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/google_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 50),
            Image.asset(
              'assets/logo.png',
            ),
            SizedBox(height: 40),

            Center(
              child: const Text(
                Pallete.logoText,
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: Pallete.logoFont,
                  color: Pallete.logoColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: const Text(
                Pallete.homeText,
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Roboto',
                  color: Pallete.textColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 60),

            GoogleButton()
          ],
        ),
      ),
    );
  }
}
