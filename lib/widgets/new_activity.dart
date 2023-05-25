import 'package:flutter/material.dart';

import '../list/days_list.dart';
import '../model/activity.dart';
import '../model/day.dart';

//Class contains functionality of adding New Activity
class NewActivity extends StatefulWidget {
  const NewActivity({super.key, required this.onAddActivity});

  final void Function(Activity activity) onAddActivity;

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  final _titleController = TextEditingController();
  Category _selectedCategory = Category.family;
  Day _selectedDay = days.first;

  //Method save New Activity and adds it to list of day activities.
  //Shows error if input is invalid.
  void _submitActivityData() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Invalid input'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Okay'),
                  ),
                ],
              ));
      return;
    }
    //if(_selectedDay == days.where((element) => false)){}
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
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Activity')),
          ],
        ),
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
