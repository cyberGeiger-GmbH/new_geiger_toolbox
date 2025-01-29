import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_formater.g.dart';

@riverpod
String formattedDate(Ref ref, {required String inputDate}) {
  final dateString = _convertToStandard(inputDate);
  try {
    // when [inputeDate] formate is YYYY-MM-DD
    DateTime parsedDate = DateTime.parse(dateString ?? inputDate);

    // Format the date to a user-friendly string
    String formattedDate = DateFormat('EEEE, MMM. d y').format(parsedDate);
    return formattedDate;
  } catch (e) {
    // Manually parse the date in "YYYY/MM/DD" format
    DateTime parsedDate =
        DateFormat("yyyy/MM/dd").parse(dateString ?? inputDate);
    // Format the date to a user-friendly string
    String formattedDate = DateFormat('EEEE, MMM. d y').format(parsedDate);
    return formattedDate;
  }
}

@riverpod
DateTime stringToDate(Ref ref, {required String inputDate}) {
  final dateString = _convertToStandard(inputDate);
  try {
    // Remove " GMT" to make it compatible with DateTime.parse

    // when [inputeDate] formate is YYYY-MM-DD
    DateTime parsedDate = DateTime.parse(dateString ?? inputDate);

    return parsedDate;
  } catch (e) {
    // Manually parse the date in "YYYY/MM/DD" format
    DateTime parsedDate =
        DateFormat("yyyy/MM/dd").parse(dateString ?? inputDate);
    return parsedDate;
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

String? _convertToStandard(String inputDate) {
  // Remove " GMT" to make it compatible with DateTime.parse

  if (inputDate.endsWith(" GMT")) {
    final dateString = inputDate.replaceAll(" GMT", "");
    return dateString;
  }
  return null;
}
