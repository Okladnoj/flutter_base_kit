import 'package:intl/intl.dart';

abstract class DateTimeParser {
  static String? dateToTaxString(DateTime? date) {
    if (date == null) return null;

    return DateFormat(_dateBirthdayPattern).format(date);
  }

  static DateTime dateFromString(String inputString) {
    return DateFormat(_datePattern).parse(inputString);
  }

  static String dateToYearString(DateTime date) {
    return DateFormat(_dateYear).format(date);
  }

  static String dateGoalsString(DateTime? date) {
    if (date == null) return '';
    return DateFormat(_dateGoals).format(date);
  }

  static String dateToMonthString(DateTime date) {
    return DateFormat(_dateMonth).format(date);
  }

  static String dateToDayString(DateTime date) {
    return DateFormat(_dateDay).format(date);
  }

  static const _dateBirthdayPattern = 'dd-MMM-yyyy';
  static const _dateGoals = 'MMM d, yyyy';
  static const _datePattern = 'yyyy-MM-dd HH:mm';
  static const _dateYear = 'yyyy';
  static const _dateMonth = 'MMMM';
  // static const _dateWeek = 'EEE';
  static const _dateDay = 'd';
}
