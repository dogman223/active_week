import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
//Globally used formatted date object
var formatter = DateFormat('dd-MMM-y');

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
  final Category category;
  final String id;
  final DateTime date;

  //Getter for globally using date format
  String get formattedDate {
    return formatter.format(date);
  }

  Activity(this.title, this.category, this.date) : id = uuid.v4();
}
