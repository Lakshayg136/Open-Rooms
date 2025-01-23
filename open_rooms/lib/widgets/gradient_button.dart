import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.transparent,
              fixedSize: const Size(400, 60),
              shadowColor: Pallete.transparent),
          child: Text(
            'Hello',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Pallete.buttonTextColor,
            ),
          )),
    );
  }
}
