import 'package:flutter/material.dart';

import 'package:active_week/screen/week_screen.dart';
import 'package:active_week/widgets/start_week_item.dart';

//Main menu screen
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  //Future navigates to screen of day
  Future navigateWeekScreen(BuildContext context, Widget buildWeekScreen) {
    var navigator = Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => buildWeekScreen,
    ));
    return navigator;
  }

  void openWeekScreen(BuildContext context, WeekScreen weekScreen) {
    navigateWeekScreen(context, WeekScreen());
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Active Week'),
        elevation: 20,
        shadowColor: Theme.of(context).primaryColor,
      ),
      body: Center(child: StartWeekItem(selectStartWeek: () {
        openWeekScreen(context, WeekScreen());
      })),
    );
  }
}
