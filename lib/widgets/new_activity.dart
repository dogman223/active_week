import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../list/days_list.dart';
import '../model/activity.dart';
import '../model/day.dart';

//Class contains functionality of adding New Activity data
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

  //Method save input of New Activity and adds it to data base and to list.
  // # Post method included.
  // # Uses onAddActivity Function.
  // # Shows error if input is invalid.
  void _submitActivityData() async {
    final url = Uri.https('active-week-1cfe4-default-rtdb.firebaseio.com',
        'activities-list.json');
    await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': _titleController.text,
          'day': _selectedDay.title,
          'category': _selectedCategory.name
        }));

    if (!context.mounted) {
      return;
    }

    widget.onAddActivity(Activity(_titleController.text, _selectedDay,
        _selectedCategory, DateTime.now().toString()));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  //Apearance, functions & buttons of visible modal bottom sheet.
  //Buttons are keeping into variables.
  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      controller: _titleController,
      maxLength: 50,
      decoration: const InputDecoration(label: Text('Title')),
    );
    var categoriesButton = Row(
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
    );
    var dayButton = Row(
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
    );
    var saveButton = Row(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shadowColor: const MaterialStatePropertyAll(Colors.green)),
            onPressed: () {
              print(_titleController.text);
            },
            child: const Text('Save Activity')),
      ],
    );
    var addActivityButton = Row(
      children: [
        ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shadowColor: const MaterialStatePropertyAll(Colors.green)),
            onPressed: _submitActivityData,
            child: const Text('Add Activity')),
      ],
    );

    return Column(
      children: [
        //TextField with New Activity title input
        textField,
        //Button with choice category of New Activity
        categoriesButton,
        //Button with choice of day of a New Activity
        dayButton,
        //'Save Activity' button
        saveButton,
        //'Add Activity' button, adds new data to list and to data base.
        addActivityButton,
      ],
    );
  }
}
