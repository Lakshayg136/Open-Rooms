import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class Blocks extends StatelessWidget {
  const Blocks({super.key, required this.image, required this.text, required this.onTap});

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8 / 3,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Pallete.gradient1,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
            // gradient: LinearGradient(colors: [
            //   Pallete.gradient1,
            //   Pallete.gradient2,
            //   Pallete.gradient3,
            // ])
          ),
          child: Stack(
            children: [
              Positioned(
                  bottom: 20,
                  left: 50,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Pallete.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
