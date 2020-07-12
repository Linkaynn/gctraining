class DateUtil {
  static String dayMonthYear(DateTime date) {
    return "${_formatDigit(date.day)}/${_formatDigit(date.month)}/${date.year}";
  }

  static String hourMinutes(DateTime date) {
    return "${_formatDigit(date.hour)}:${_formatDigit(date.minute)}";
  }

  static String dayMonthYearHourMinutes(DateTime date) {
    return "${dayMonthYear(date)} ${hourMinutes(date)}";
  }

  static String _formatDigit(int digit) {
    return digit.toString().padLeft(2, "0");
  }

  static bool sameDay(DateTime date, DateTime date2) {
    return DateUtil.dayMonthYear(date) == DateUtil.dayMonthYear(date2);
  }

  static String toRealISO8601(DateTime date) {
    return date.toIso8601String().endsWith('Z') ? date.toIso8601String() : '${date.toIso8601String()}Z';
  }

  static int calculateDaysBetween(DateTime dateTime, DateTime dateTime2) {
    return ((dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch) / (1000 * 60 * 60 * 24)).floor();
  }

  static int calculateDYearsBetween(DateTime dateTime, DateTime dateTime2) {
    return ((dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch) / (1000 * 60 * 60 * 24 * 365)).floor();
  }

  static Map<String, int> getExpirationFrom(DateTime dateTime) {
    Map<String, int> response = Map();

    int difference = dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

    response['months'] = (difference / (1000 * 60 * 60 * 24 * 30)).floor();
    response['days'] = ((difference / (1000 * 60 * 60 * 24)) - response['months'] * 30).floor();

    return response;
  }
}
