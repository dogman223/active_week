import 'package:flutter/material.dart';

import '../model/activity.dart';

//Class contains functionality of adding New Activity
class NewActivity extends StatefulWidget {
  const NewActivity({super.key});

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  final _titleController = TextEditingController();
  Category _selectedCategory = Category.family;

  //void _chooseDayHandler() {}

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
            ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Activity')),
          ],
        )
      ],
    );
  }
}
