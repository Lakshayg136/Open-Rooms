import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class TopView extends StatelessWidget {
  const TopView(
      {super.key, required this.text1, required this.text2, required this.add});

  final String text1;
  final String text2;
  final List<Widget> add;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (text1.isNotEmpty)
                      Text(
                        text1,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    SizedBox(height: 05),
                    Text(
                      text2,
                      style: TextStyle(
                          color: Pallete.homeColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ),
              ...add,
            ]),
      ),
    );
  }
}
