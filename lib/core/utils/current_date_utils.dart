import 'package:intl/intl.dart';

class DateUtils {
  static String currentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate; //
  }
}
