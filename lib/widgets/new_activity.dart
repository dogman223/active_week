import 'dart:convert';

import 'package:active_week/list/icons_list.dart';
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
  //DateTime _selectedDate;

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
          'category': _selectedCategory.name,
        }));

    if (!context.mounted) {
      return;
    }

    widget.onAddActivity(Activity(
      _titleController.text,
      _selectedDay,
      _selectedCategory,
      DateTime.now().toString(),
      //_selectedDate,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  //Apearance, functions & buttons of visible modal bottom sheet.
  //Buttons are storing into variables.
  @override
  Widget build(BuildContext context) {
    //TextField with New Activity title input
    var textField = Container(
      margin: const EdgeInsetsDirectional.all(5),
      child: TextField(
        controller: _titleController,
        maxLength: 50,
        decoration: const InputDecoration(label: Text('Title')),
      ),
    );
    //Button with choice category of New Activity
    var categoriesButton = Container(
      margin: const EdgeInsetsDirectional.all(5),
      child: Row(
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
    );
    //Button with choice of day of a New Activity
    var dayButton = Container(
      margin: const EdgeInsetsDirectional.all(5),
      child: Row(
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
    );
    //Date picker
    var selectDateButton = Row(
      children: [
        const Text('Selected Date'),
        IconButton(onPressed: () {}, icon: iconsList[13]),
      ],
    );
    //'Save Activity' button
    var saveButton = Container(
      margin: const EdgeInsetsDirectional.all(5),
      child: Row(
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
      ),
    );
    //'Add Activity' button, adds new data to list and to data base.
    var addActivityButton = Container(
      margin: const EdgeInsetsDirectional.all(5),
      child: Row(
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  shadowColor: const MaterialStatePropertyAll(Colors.green)),
              onPressed: _submitActivityData,
              child: const Text('Add Activity')),
        ],
      ),
    );

    return Column(
      children: [
        textField,
        Row(
          children: [
            categoriesButton,
            SizedBox(
              width: 50,
            ),
            selectDateButton,
          ],
        ),
        dayButton,
        saveButton,
        addActivityButton,
      ],
    );
  }
}
