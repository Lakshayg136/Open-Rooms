import 'package:flutter/material.dart';
import 'package:open_rooms/screens/login_screen.dart';
import 'package:open_rooms/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Rooms',
      theme: AppTheme.darkThemeMode,
      home: LoginScreen(),
    );
  }
}
