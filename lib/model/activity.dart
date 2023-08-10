import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

///final formatter = DateFormat

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

  Activity(this.title, this.category, this.date) : id = uuid.v4();
}
