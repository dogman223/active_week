import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../list/days_list.dart';
import '../model/activity.dart';
import '../model/day.dart';

//Class contains functionality of adding New Activity
class NewActivity extends StatefulWidget {
  const NewActivity({super.key, required this.onAddActivity});

  //Add Activity Function
  final void Function(Activity activity) onAddActivity;

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  final _titleController = TextEditingController();
  Category _selectedCategory = Category.family;
  Day _selectedDay = days.first;

  //Method save input of New Activity and adds it to data base.
  //Post method included.
  //Uses onAddActivity Function.
  //Shows error if input is invalid.
  void _submitActivityData() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': _titleController.text,
        }));

    if (!context.mounted) {
      return;
    }

    widget.onAddActivity(
        Activity(_titleController.text, _selectedDay, _selectedCategory));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TextField with New Activity title input
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('Title')),
        ),
        //Button with choice category of New Activity
        Row(
          children: [
            DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                        value: category, child: Text(category.name)))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
          ],
        ),
        Row(
          children: [
            DropdownButton(
                value: _selectedDay,
                items: days
                    .map((day) =>
                        DropdownMenuItem(value: day, child: Text(day.title)))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedDay = value;
                  });
                }),
          ],
        ),
        //'Save Activity' button
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Activity')),
          ],
        ),
        //'Add Activity' button
        Row(
          children: [
            ElevatedButton(
                onPressed: _submitActivityData,
                child: const Text('Add Activity')),
          ],
        ),
      ],
    );
  }
}
