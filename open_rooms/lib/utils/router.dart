import 'package:flutter/material.dart';
import 'package:open_rooms/screens/home_screen.dart';
import 'package:open_rooms/screens/login_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: HomeScreen())});
