import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:open_rooms/widgets/floor_top.dart';
import 'package:open_rooms/widgets/room_button.dart';
import 'package:routemaster/routemaster.dart';

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
    '11.20 to 12.10',
    '12.10 to 13.00',
    '13.00 to 13.50',
    '13.50 to 14.40',
    '14.40 to 15.30',
    '15.30 to 16.25',
  ];
  String valueChoose = "09.30 to 10.20";

  List<String> faculty_rooms = [];
  List<String> lab_rooms = [];
  List<String> occupied_rooms = [];
  List<String> available_rooms = [];

  void updateRooms() {
    faculty_rooms = ['08', '16'];
    lab_rooms = ['02', '04', '06', '13', '11'];
    if (valueChoose == items[0]) {
      occupied_rooms = ['01', '03', '05'];
    } else if (valueChoose == items[1]) {
      occupied_rooms = ['03', '09', '14'];
    } else if (valueChoose == items[2]) {
      occupied_rooms = ['09', '01'];
    } else if (valueChoose == items[3]) {
      occupied_rooms = ['01', '09', '14'];
    }

    available_rooms =
        List.generate(16, (i) => (i + 1).toString().padLeft(2, '0'))
            .where((room) =>
                !faculty_rooms.contains(room) &&
                !lab_rooms.contains(room) &&
                !occupied_rooms.contains(room))
            .toList();
  }

  void onDropdownChanged(String newValue) {
    setState(() {
      valueChoose = newValue;
      updateRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    updateRooms();

    return Scaffold(
      backgroundColor: Pallete.backgroundColor2,
      appBar: AppBar(
        foregroundColor: Pallete.logoColor,
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Routemaster.of(context).push('/building/${widget.sblock}'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showInfoDialog(context);
            },
            icon: Icon(Icons.info_outline),
          )
        ],
      ),
      body: FloorTop(
        text1: widget.sblock,
        text2: 'Level-${widget.floor}',
        selectedTime: valueChoose,
        onDropdownChanged: onDropdownChanged,
        add: [
          Row(
            children: [
              _buildRoomColumn(start: 1, end: 8),
              SizedBox(width: 20),
              _buildRoomColumn(start: 9, end: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomColumn({required int start, required int end}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = start; i <= end; i++)
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(top: 20, left: 30),
            decoration: available_rooms.contains(i.toString().padLeft(2, '0'))
                ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  )
                : null,
            child: RoomButton(
              color: _getRoomColor(i.toString().padLeft(2, '0')),
              buttonText: 'Room-${widget.floor}${i.toString().padLeft(2, '0')}',
              onTap: () {},
            ),
          ),
      ],
    );
  }

  Color _getRoomColor(String roomNumber) {
    if (faculty_rooms.contains(roomNumber)) {
      return Colors.red;
    } else if (lab_rooms.contains(roomNumber)) {
      return Colors.amber;
    } else if (occupied_rooms.contains(roomNumber)) {
      return Colors.grey;
    } else {
      return Colors.green;
    }
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Information"),
          content: Text(
              "🟩 - Rooms Available \n🟥 - Faculty Rooms \n🟨 - Lab Rooms \n⬜ - Occupied"),
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
