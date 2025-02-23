import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({super.key, required this.buttonText, required this.onTap, required this.color});

  final String buttonText;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.transparent,
              fixedSize: const Size(150, 15),
              shadowColor: Pallete.transparent),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Pallete.primaryColor, 
            ),
          )),
    );
  }
}
