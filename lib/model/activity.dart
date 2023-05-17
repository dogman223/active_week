import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './day.dart';

enum Category {
  sport,
  meal,
  entertainment,
  learning,
  travel,
  rest,
  spirituality,
  hobby,
  social,
  family,
  friends,
  work,
}

class Activity {
  final String id;
  final String title;
  final Day day;
  final Category category;

  Activity(this.id, @required this.title, @required this.day,
      @required this.category);
}
