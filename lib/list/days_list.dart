import '/model/day.dart';

//Available days to select due to adding new activity
var days = [
  Day('Yesterday', yesterday, yesterday.weekday),
  Day('Today', today, today.weekday),
  Day('Tomorrow', tomorrow, tomorrow.weekday),
  Day('Day After tomorrow', dayAfterTomorrow, dayAfterTomorrow.weekday),
  Day('Second Day After tomorrow', secondDayAfterTomorrow,
      secondDayAfterTomorrow.weekday),
  Day('Third Day After tomorrow', thirdDayAfterTomorrow,
      thirdDayAfterTomorrow.weekday),
  Day('Fourth Day After tomorrow', fourthDayAfterTomorrow,
      fourthDayAfterTomorrow.weekday),
];

var dates = [
  yesterday,
  today,
  tomorrow,
  dayAfterTomorrow,
  secondDayAfterTomorrow,
  thirdDayAfterTomorrow,
  fourthDayAfterTomorrow
];

//Dates of each available days saved in variables
final yesterday = DateTime(today.year, today.month, today.day - 1);
final today = DateTime.now();
final tomorrow = DateTime(today.year, today.month, today.day + 1);
final dayAfterTomorrow = DateTime(today.year, today.month, today.day + 2);
final secondDayAfterTomorrow = DateTime(today.year, today.month, today.day + 3);
final thirdDayAfterTomorrow = DateTime(today.year, today.month, today.day + 4);
final fourthDayAfterTomorrow = DateTime(today.year, today.month, today.day + 5);
