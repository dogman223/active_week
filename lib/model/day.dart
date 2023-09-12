import 'activity.dart';

class Day {
  String title;
  DateTime date;
  int weekday;

  //Getter for globally using date format
  String get formattedDate {
    return formatter.format(date);
  }

  Day(this.title, this.date, this.weekday);
}
