import 'package:intl/intl.dart' show DateFormat;

class DateParser {

  String readableDate(DateTime dateTime) {
    DateFormat dateTimeFormat = DateFormat('EEEE, d MMMM y HH:mm', 'fr_FR');

    String string = dateTimeFormat.format(dateTime);
    return string;
  }
}