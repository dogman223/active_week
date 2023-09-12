import 'package:flutter/material.dart';

import 'package:active_week/screen/main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Active Week',
      home: const MainMenuScreen(),
      theme: ThemeData().copyWith(useMaterial3: true),
    );
  }
}
