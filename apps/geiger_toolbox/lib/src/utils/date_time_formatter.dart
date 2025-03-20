import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_time_formatter.g.dart';

@riverpod
String dateTimeStringFormatter(Ref ref, {required String inputDate}) {
  final dateString = _convertToStandard(inputDate);
  try {
    // when [inputeDate] formate is YYYY-MM-DD
    DateTime parsedDate = DateTime.parse(dateString);

    // Format the date to a user-friendly string
    String formattedDate = DateFormat('EEEE, MMM. d y').format(parsedDate);
    return formattedDate;
  } catch (e) {
    // Manually parse the date in "YYYY/MM/DD" format
    DateTime parsedDate = DateFormat("yyyy/MM/dd").parse(dateString);
    // Format the date to a user-friendly string
    String formattedDate = DateFormat('EEEE, MMM. d y').format(parsedDate);
    return formattedDate;
  }
}

@riverpod
String dateTimeFormatter(Ref ref, {required DateTime inputDate}) {
  // Format the date to a user-friendly string
  String formattedDate = DateFormat('E, MMM. d, y').format(inputDate);
  return formattedDate;
}

@riverpod
DateTime stringToDate(Ref ref, {required String inputDate}) {
  final dateString = _convertToStandard(inputDate);
  try {
    // Remove " GMT" to make it compatible with DateTime.parse

    // when [inputeDate] formate is YYYY-MM-DD
    DateTime parsedDate = DateTime.parse(dateString);

    return parsedDate;
  } catch (e) {
    // Manually parse the date in "YYYY/MM/DD" format
    DateTime parsedDate = DateFormat("yyyy/MM/dd").parse(dateString);
    return parsedDate;
  }
}

@riverpod
String timeAgo(Ref ref, {required DateTime timestamp}) {
  Duration difference = DateTime.now().difference(timestamp);

  if (difference.inSeconds < 60) {
    return "now";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} min ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
  } else if (difference.inDays < 7) {
    return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
  } else {
    return DateFormat('E, MMM. d, y').format(timestamp);
  }
}

@riverpod
DateTime previousMonth(Ref ref, {int month = 6}) {
  assert(month > 0, 'month must be greater than 0.');
  // Get the date 6 months ago
  final now = DateTime.now();
  final date = DateTime(now.year, now.month - month, now.day);
  // Assert that the calculated date is valid

  assert(date.isBefore(now), 'Calculated date for $month months ago must be before the current date.');
  return date;
}

String _convertToStandard(String inputDate) {
  // Remove " GMT" to make it compatible with DateTime.parse

  if (inputDate.trim().endsWith(" GMT")) {
    final dateString = inputDate.replaceAll(" GMT", "Z");
    return dateString;
  } else {
    return inputDate;
  }
}
