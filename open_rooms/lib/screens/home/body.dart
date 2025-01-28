import 'package:flutter/material.dart';
import 'package:open_rooms/screens/home/blocks.dart';
import 'package:open_rooms/screens/signup_screen.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 05),
                Text(
                  '$username!',
                  style: TextStyle(
                      color: Pallete.homeColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Where Are You?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Blocks(
                          image: 'assets/a1_block.jpg',
                          text: 'A Block',
                          onTap: () {}),
                      Blocks(
                          image: 'assets/d_block.jpg',
                          text: 'B Block',
                          onTap: () {}),
                      Blocks(
                          image: 'assets/c_block.jpg',
                          text: 'C Block',
                          onTap: () {}),
                      Blocks(
                          image: 'assets/d_block.jpg',
                          text: 'D Block',
                          onTap: () {}),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/home_bg.png')),
                    ))
              ],
            ),
          )
        ]));
  }
}
