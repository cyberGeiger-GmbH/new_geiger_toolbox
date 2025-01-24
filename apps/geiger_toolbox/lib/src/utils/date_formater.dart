import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_formater.g.dart';

@riverpod
String formattedDate(Ref ref, {required String inputDate}) {
  try {
    // when [inputeDate] formate is YYYY-MM-DD
    DateTime parsedDate = DateTime.parse(inputDate);

    // Format the date to a user-friendly string
    String formattedDate = DateFormat('EEEE, MMM. d y').format(parsedDate);
    return formattedDate;
  } catch (e) {
    // Manually parse the date in "YYYY/MM/DD" format
    DateTime parsedDate = DateFormat("yyyy/MM/dd").parse(inputDate);
    // Format the date to a user-friendly string
    String formattedDate = DateFormat('EEEE, MMM. d y').format(parsedDate);
    return formattedDate;
  }
}

@riverpod
DateTime previousMonth(Ref ref, {int month = 6}) {
  assert(month > 0, 'month must be greater than 0.');
  // Get the date 6 months ago
  final now = DateTime.now();
  final date = DateTime(now.year, now.month - month, now.day);
  // Assert that the calculated date is valid

  assert(date.isBefore(now),
      'Calculated date for $month months ago must be before the current date.');
  return date;
}
