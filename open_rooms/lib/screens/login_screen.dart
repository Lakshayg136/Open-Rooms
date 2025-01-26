import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_rooms/resources/auth/auth_controller.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/google_button.dart';
import 'package:open_rooms/widgets/loader.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
      ),
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Loader()
          : Padding(
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
