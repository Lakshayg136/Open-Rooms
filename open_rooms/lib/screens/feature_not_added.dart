import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class FeatureNotAdded extends StatelessWidget {
  const FeatureNotAdded({super.key, required this.page});

  final String page;

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
                    Text(
                      '$page',
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
                child: Container(
                  padding: EdgeInsets.only(top: 60),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'This feature is coming soon.',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}
