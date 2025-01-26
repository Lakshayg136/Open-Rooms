import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class SettingsDrawer extends ConsumerWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Pallete.borderColor,
        ),
        Container(
          height: 50,
          color: Pallete.gradient1,
        ),
        Container(
          height: 50,
          color: Pallete.gradient1,
        )
      ],
    );
  }
}
