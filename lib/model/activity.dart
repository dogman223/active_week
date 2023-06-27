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
  health,
}

class Activity {
  final String title;
  final Day day;
  final Category category;
  final String id;

  Activity(
    @required this.title,
    this.day,
    @required this.category,
    this.id,
  );
}
