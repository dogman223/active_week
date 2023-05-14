import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Activity {
  String id;
  String title;
  String type;
  Icon icon;
  var day;

  Activity(this.id, @required this.title, @required this.type,
      @required this.icon, @required this.day);
}
