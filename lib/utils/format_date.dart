import 'package:intl/intl.dart';

String formatDateTime({
  required DateTime dateTime,
  String format = 'd MMMM yyyy, HH:mm',
}) {
  return DateFormat(format).format(dateTime);
}
