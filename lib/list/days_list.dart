import '/model/day.dart';

//Available days to select due to adding new activity
var days = [
  Day('Yesterday', yesterday),
  Day('Today', today),
  Day('Tomorrow', tomorrow),
  Day('Day After tomorrow', dayAftertomorrow),
  Day('Second Day After tomorrow', secondDayAftertomorrow),
  Day('Third Day After tomorrow', thirdDayAftertomorrow),
  Day('Fourth Day After tomorrow', fourthDayAftertomorrow),
];

var dates = [
  yesterday,
  today,
  tomorrow,
  dayAftertomorrow,
  secondDayAftertomorrow,
  thirdDayAftertomorrow,
  fourthDayAftertomorrow
];

final yesterday = DateTime(today.year, today.month, today.day - 1);
final today = DateTime.now();
final tomorrow = DateTime(today.year, today.month, today.day + 1);
final dayAftertomorrow = DateTime(today.year, today.month, today.day + 2);
final secondDayAftertomorrow = DateTime(today.year, today.month, today.day + 3);
final thirdDayAftertomorrow = DateTime(today.year, today.month, today.day + 4);
final fourthDayAftertomorrow = DateTime(today.year, today.month, today.day + 5);
