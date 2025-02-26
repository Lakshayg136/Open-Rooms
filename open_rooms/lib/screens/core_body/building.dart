import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/Top_view.dart';
import 'package:open_rooms/widgets/small_button.dart';
import 'package:routemaster/routemaster.dart';

class Building extends StatefulWidget {
  const Building({super.key, required this.sblock});

  final String sblock;

  @override
  State<Building> createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  late int numberOfFloors;

  @override
  void initState() {
    numberOfFloors = _getNumberOfFloors(widget.sblock);
    super.initState();
  }

  int _getNumberOfFloors(String building) {
    if (building == 'A1') {
      return 6;
    }
    return 7;
  }

  void navigateToFloor(BuildContext context, String sblock, String floor) {
    Routemaster.of(context).push('/floor/$sblock/$floor');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor2,
      appBar: AppBar(
        foregroundColor: Pallete.logoColor,
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Routemaster.of(context).push('/block/${widget.sblock[0]}'),
        ),
      ),
      body: TopView(
          text1: '${widget.sblock} Block',
          text2: 'Select your Floor',
          add: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Image.asset(
                    'assets/building.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 1;
                          i <= numberOfFloors;
                          i++) // Loop to add multiple texts
                        Container(
                          // padding: EdgeInsets.only(left: 30),
                          margin: EdgeInsets.only(top: 30, left: 30),
                          child: SmallButton(
                              color: Pallete.appbarColor,
                              buttonText: 'Level-$i',
                              onTap: () => navigateToFloor(context,
                                  widget.sblock, '$i')), // Example text
                        ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
