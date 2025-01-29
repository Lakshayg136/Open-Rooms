import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/Top_view.dart';
import 'package:open_rooms/widgets/floor_top.dart';
import 'package:open_rooms/widgets/room_button.dart';

class FloorPlan extends StatefulWidget {
  const FloorPlan({super.key, required this.sblock, required this.floor});

  final String sblock;
  final String floor;

  @override
  State<FloorPlan> createState() => _FloorPlanState();
}

class _FloorPlanState extends State<FloorPlan> {
  final List<String> items = [
    "09.30 to 10.20",
    '10.20 to 11.10',
    '11.10 to 12.00',
    '12.00 to 13.15'
  ];
  late String valueChoose = items.first;

  @override
  Widget build(BuildContext context) {
    final List faculty_rooms = ['08', '16'];
    final List lab_rooms = ['02', '04', '06'];
    final List occupied_rooms = ['01', '11', '12'];

    return Scaffold(
        backgroundColor: Pallete.backgroundColor2,
        appBar: AppBar(
          foregroundColor: Pallete.logoColor,
          backgroundColor: Pallete.backgroundColor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  _showInfoDialog(context);
                },
                icon: Icon(Icons.info_outline))
          ],
        ),
        body: FloorTop(
            text1: widget.sblock,
            text2: 'Level-${widget.floor}',
            add: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 1; i <= 8; i++)
                        Container(
                          // padding: EdgeInsets.only(left: 30),
                          margin: EdgeInsets.only(top: 30, left: 30),
                          child: RoomButton(
                              color: faculty_rooms
                                      .contains(i.toString().padLeft(2, '0'))
                                  ? Colors.red
                                  : lab_rooms.contains(
                                          i.toString().padLeft(2, '0'))
                                      ? Colors.amber
                                      : occupied_rooms.contains(
                                              i.toString().padLeft(2, '0'))
                                          ? Colors.grey
                                          : Colors.green,
                              buttonText:
                                  'Room-${widget.floor}${i.toString().padLeft(2, '0')}',
                              onTap: () {}),
                        ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 9; i <= 16; i++)
                        Container(
                          // padding: EdgeInsets.only(left: 30),
                          margin: EdgeInsets.only(top: 30, left: 30),
                          child: RoomButton(
                              color: faculty_rooms
                                      .contains(i.toString().padLeft(2, '0'))
                                  ? Colors.red
                                  : lab_rooms.contains(
                                          i.toString().padLeft(2, '0'))
                                      ? Colors.amber
                                      : occupied_rooms.contains(
                                              i.toString().padLeft(2, '0'))
                                          ? Colors.grey
                                          : Colors.green,
                              buttonText:
                                  'Room-${widget.floor}${i.toString().padLeft(2, '0')}',
                              onTap: () {}),
                        ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            ]));
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Information"),
          content: Text(
              "🟩 - Rooms Available \n🟥 - Faculty Rooms \n🟨 - Lab Rooms \n⬜ - Occupied "),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
