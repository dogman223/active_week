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

  //Build Text Field for title input.
  Widget buildTextField(BuildContext context) {
    var textField = TextField(
      controller: _titleController,
      maxLength: 50,
      decoration: const InputDecoration(label: Text('Title')),
    );
    return textField;
  }

  //Build button of select category functionality.
  Widget buildCategoriesButton(BuildContext context) {
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
    return categoriesButton;
  }

  //Build button of select day functionality.
  Widget buildDayButton(BuildContext context) {
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
    return dayButton;
  }

  //Build 'save' activity button.
  Widget buildSaveButton(BuildContext context) {
    var saveButton = Row(
      children: [
        ElevatedButton(
            onPressed: () {
              print(_titleController.text);
            },
            child: const Text('Save Activity')),
      ],
    );
    return saveButton;
  }

  //Build add activity button.
  Widget buildAddActivityButton(BuildContext context) {
    var addActivityButton = Row(
      children: [
        ElevatedButton(
            onPressed: _submitActivityData, child: const Text('Add Activity')),
      ],
    );
    return addActivityButton;
  }

  //Apearance, functions & buttons of visible modal bottom sheet.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TextField with New Activity title input
        buildTextField(context),
        //Button with choice category of New Activity
        buildCategoriesButton(context),
        //Button with choice of day of a New Activity
        buildDayButton(context),
        //'Save Activity' button
        buildSaveButton(context),
        //'Add Activity' button, adds new data to list and to data base.
        buildAddActivityButton(context),
      ],
    );
  }
}
