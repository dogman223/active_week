import '/model/day.dart';

//Available days to select due to adding new activity
var days = [
  Day('Yesterday', yesterday, yesterdayWeekday),
  Day('Today', today, todayWeekday),
  Day('Tomorrow', tomorrow, tomorrowWeekday),
  Day('Day After tomorrow', dayAftertomorrow, afterTomorrowWeekday),
  Day('Second Day After tomorrow', secondDayAftertomorrow,
      secondDayAfterTomorrowWeekday),
  Day('Third Day After tomorrow', thirdDayAftertomorrow,
      thirdDayAfterTomorrowWeekday),
  Day('Fourth Day After tomorrow', fourthDayAftertomorrow,
      fourthDayAfterTomorrowWeekday),
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

final yesterdayWeekday = today.weekday - 1;
final todayWeekday = today.weekday;
final tomorrowWeekday = today.weekday + 1;
final afterTomorrowWeekday = today.weekday + 2;
final secondDayAfterTomorrowWeekday = today.weekday + 3;
final thirdDayAfterTomorrowWeekday = today.weekday + 4;
final fourthDayAfterTomorrowWeekday = today.weekday + 5;
