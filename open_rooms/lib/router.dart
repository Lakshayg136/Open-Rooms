import 'package:flutter/material.dart';
import 'package:open_rooms/screens/core_body/block.dart';
import 'package:open_rooms/screens/core_body/building.dart';
import 'package:open_rooms/screens/core_body/floor_plan.dart';
import 'package:open_rooms/screens/feature_not_added.dart';
import 'package:open_rooms/screens/home/home_screen.dart';
import 'package:open_rooms/screens/login_screen.dart';
import 'package:open_rooms/screens/settings/settings_screen.dart';
import 'package:open_rooms/screens/signup_screen.dart';
import 'package:open_rooms/screens/timetable.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/settings': (routeData) => MaterialPage(child: SettingsScreen()),
  '/sign-up/:uid': (routeData) => MaterialPage(
          child: SignUpScreen(
        uid: routeData.pathParameters['uid']!,
      )),
  '/feature-missing/:page': (routeData) => MaterialPage(
          child: FeatureNotAdded(
        page: routeData.pathParameters['page']!,
      )),
  '/timetable': (routeData) => MaterialPage(
          child: Timetable()),
  '/block/:block': (routeData) => MaterialPage(
          child: Block(
        block: routeData.pathParameters['block']!,
      )),
  '/building/:sblock': (routeData) => MaterialPage(
          child: Building(
        sblock: routeData.pathParameters['sblock']!,
      )),
  '/floor/:sblock/:floor': (routeData) => MaterialPage(
          child: FloorPlan(
        sblock: routeData.pathParameters['sblock']!,
        floor: routeData.pathParameters['floor']!,
      )),
});
