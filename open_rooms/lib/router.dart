import 'package:flutter/material.dart';
import 'package:open_rooms/screens/home/home_screen.dart';
import 'package:open_rooms/screens/login_screen.dart';
import 'package:open_rooms/screens/settings/settings_screen.dart';
import 'package:open_rooms/screens/signup_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/settings': (routeData) => MaterialPage(
      child: SettingsScreen()),
  '/sign-up/:uid': (routeData) => MaterialPage(
          child: SignUpScreen(
        uid: routeData.pathParameters['uid']!,
      )),
});
