import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_rooms/resources/auth/auth_controller.dart';
import 'package:open_rooms/screens/home/body.dart';
import 'package:open_rooms/screens/home/drawers/list_drawer.dart';
import 'package:open_rooms/screens/home/drawers/settings_drawer.dart';
import 'package:open_rooms/utils/app_pallete.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
        backgroundColor: Pallete.backgroundColor2,
        appBar: AppBar(
          foregroundColor: Pallete.logoColor,
          backgroundColor: Pallete.backgroundColor,
          elevation: 0,

          leading: Builder(builder: (context) {
            return IconButton(
              padding: EdgeInsets.only(left: 10, top: 10),
              onPressed: () => displayDrawer(context),
              icon: Icon(Icons.menu_rounded),
              iconSize: 35,
            );
          }),

          // title: const Text(
          //   Pallete.logoText,
          //   style: TextStyle(
          //     fontSize: 25,
          //     fontFamily: Pallete.logoFont,
          //     color: Pallete.logoColor,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          // centerTitle: true,

          // actions: [
          //   // IconButton(
          //   //     onPressed: () => SettingsDrawer(),
          //   //     icon: Icon(Icons.settings),
          //   //     iconSize: 35)
          // ],
        ),
        drawer: const ListDrawer(),
        // endDrawer: const SettingsDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  color: Pallete.logoColor,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Pallete.logoColor,
                ),
                label: '')
          ],
          backgroundColor: Pallete.backgroundColor,
        ),
        body: BodyHome(
          username: user.name,
        ));
  }
}
