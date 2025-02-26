import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class FloorTop extends StatefulWidget {
  const FloorTop({
    super.key,
    required this.text1,
    required this.text2,
    required this.selectedTime,
    required this.onDropdownChanged,
    required this.add,
  });

  final String text1;
  final String text2;
  final String selectedTime;
  final Function(String) onDropdownChanged;
  final List<Widget> add;

  @override
  State<FloorTop> createState() => _FloorTopState();
}

class _FloorTopState extends State<FloorTop> {
  final List<String> items = const [
    "09.30 to 10.20",
    '10.20 to 11.10',
    '11.20 to 12.10',
    '12.10 to 13.00',
    '13.00 to 13.50',
    '13.50 to 14.40',
    '14.40 to 15.30',
    '15.30 to 16.25'
  ];

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
                  bottomLeft: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text1,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        widget.text2,
                        style: TextStyle(
                          color: Pallete.homeColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 60),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Pallete.secondaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButton<String>(
                          items: items.map((String valueItem) {
                            return DropdownMenuItem<String>(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          value: widget.selectedTime,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              widget.onDropdownChanged(newValue);
                            }
                          },
                          dropdownColor: Pallete.gradient1,
                          underline: Container(),
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          iconSize: 20,
                          style: TextStyle(
                            fontSize: 18,
                            color: Pallete.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            ...widget.add,
          ],
        ),
      ),
    );
  }
}
