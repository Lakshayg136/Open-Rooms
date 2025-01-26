import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.buttonText, required this.onTap});

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Pallete.gradient1,
              Pallete.gradient2,
              Pallete.gradient3,
            ],
          ),
          borderRadius: BorderRadius.circular(7)),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.transparent,
              fixedSize: const Size(400, 60),
              shadowColor: Pallete.transparent),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Pallete.buttonTextColor,
            ),
          )),
    );
  }
}
