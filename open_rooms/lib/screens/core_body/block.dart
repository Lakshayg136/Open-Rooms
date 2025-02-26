import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:open_rooms/widgets/Top_view.dart';
import 'package:open_rooms/widgets/list_container.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:routemaster/routemaster.dart';

class Block extends StatefulWidget {
  const Block({super.key, required this.block});

  final String block;

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  late int numberOfBuildings;

  @override
  void initState() {
    numberOfBuildings = _getNumberOfBuildings(widget.block);
    super.initState();
  }

  int _getNumberOfBuildings(String block) {
    if (block == 'A') {
      return 3;
    } else if (block == 'B') {
      return 6;
    } else if (block == 'C') {
      return 3;
    } else if (block == 'D') {
      return 6;
    } else {
      return 4;
    }
  }

  void navigateToFloor(BuildContext context, String block, String building) {
    Routemaster.of(context).push('/building/$block$building');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor2,
      appBar: AppBar(
        foregroundColor: Pallete.logoColor,
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
      ),
      body: TopView(
        text1: 'Welcome to',
        text2: '${widget.block}-Block',
        add: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Select your building',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                  ),
                  items: List.generate(
                    numberOfBuildings,
                    (index) {
                      int blockNumber = index + 1;
                      String imagePath = widget.block == 'C'
                          ? 'assets/c${blockNumber}_block.jpg'
                          : 'assets/${widget.block.toLowerCase()}_block.jpg';
                      return ListContainer(
                        image: imagePath,
                        text: '${widget.block}$blockNumber Block',
                        fontSize: 30,
                        onTap: () => navigateToFloor(
                            context, widget.block, '$blockNumber'),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
