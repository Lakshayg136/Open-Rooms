import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_rooms/utils/app_pallete.dart';
import 'package:routemaster/routemaster.dart';

class ListDrawer extends ConsumerWidget {
  const ListDrawer({super.key});

  void navigateToSettings(BuildContext context) {
    Routemaster.of(context).push('/settings');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Pallete.gradient1,
              Pallete.gradient2,
              Pallete.gradient3,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/logo.png',
            ),
            SizedBox(height: 25),
            ListTile(
              title: Text(
                'Timetable',
                style: TextStyle(
                  color: Pallete.textColor,
                  fontFamily: Pallete.drawerFont,
                  fontSize: Pallete.drawerFontSize,
                ),
              ),
              leading: Icon(
                Icons.calendar_month_rounded,
                color: Pallete.textColor,
                size: Pallete.drawerIconSize,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Faculty Rooms',
                style: TextStyle(
                  color: Pallete.textColor,
                  fontFamily: Pallete.drawerFont,
                  fontSize: Pallete.drawerFontSize,
                ),
              ),
              leading: Icon(
                Icons.meeting_room_rounded,
                color: Pallete.textColor,
                size: Pallete.drawerIconSize,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Lab Rooms',
                style: TextStyle(
                  color: Pallete.textColor,
                  fontFamily: Pallete.drawerFont,
                  fontSize: Pallete.drawerFontSize,
                ),
              ),
              leading: Icon(
                Icons.desktop_windows_rounded,
                color: Pallete.textColor,
                size: Pallete.drawerIconSize,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Pallete.textColor,
                  fontFamily: Pallete.drawerFont,
                  fontSize: Pallete.drawerFontSize,
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: Pallete.textColor,
                size: Pallete.drawerIconSize,
              ),
              onTap: () => navigateToSettings(context),
            ),
          ],
        )),
      ),
    );
  }
}
