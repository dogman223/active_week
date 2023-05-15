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
  work
}

class Activity {
  final String id;
  final String title;
  final Day day;

  Activity(this.id, @required this.title, @required this.day);
}
