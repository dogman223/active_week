import 'package:flutter/material.dart';

import '../model/activity.dart';
import '../widgets/new_activity.dart';

//Screen of activities in a day
class WenesdayScreen extends StatefulWidget {
  WenesdayScreen({super.key, required this.activities});

  List<Activity> activities;

  @override
  State<WenesdayScreen> createState() => _WenesdayScreenState();
}

class _WenesdayScreenState extends State<WenesdayScreen> {
  void _openAddActivityOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (contex) => NewActivity(onAddActivity: _addActivity));
  }

  void _addActivity(Activity activity) {
    setState(() {
      widget.activities.add(activity);
    });
  }

  //Widget builds list of activities if not empty
  Widget buildListContent(BuildContext context) {
    Widget listContent = ListView.builder(
        itemCount: widget.activities.length,
        itemBuilder: (context, index) => Text(widget.activities[index].title));

    if (widget.activities.isEmpty) {
      listContent = const Center(
          child: Text(
        'No Activities today yet!',
        style: TextStyle(fontSize: 30),
      ));
    }
    return listContent;
  }

  //Build Scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wenesday')),
      body: buildListContent(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openAddActivityOverlay(context),
      ),
    );
  }
}