import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_rooms/resources/auth_controller.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class GoogleButton extends ConsumerWidget {
  const GoogleButton({super.key});

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
        onPressed: () => signInWithGoogle(ref),
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          side: BorderSide(color: Pallete.primaryColor),
          padding: EdgeInsets.all(20),
          backgroundColor: Pallete.gradient3,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/google_logo.png',
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Text(
                'Login with Google',
                style: TextStyle(fontSize: 20, color: Pallete.buttonTextColor),
              ),
            )
          ],
        ));
  }
}
