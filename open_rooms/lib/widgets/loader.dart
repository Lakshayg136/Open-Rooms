import 'package:flutter/material.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Pallete.loadColor),
    );
  }
}
