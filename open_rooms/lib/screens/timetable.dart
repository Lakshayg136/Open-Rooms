import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class Timetable extends StatelessWidget {
  const Timetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor2,
      appBar: AppBar(
        foregroundColor: Pallete.logoColor,
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Timetable',
                    style: TextStyle(
                      color: Pallete.homeColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Pallete.backgroundColor2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  imageProvider: AssetImage('assets/timetable.jpg'),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: 4.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
