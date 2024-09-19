import 'package:intl/intl.dart';

class GeneralFunctions {
  static String formatDate(DateTime dateTime) {
    return DateFormat('E dd MMM').format(dateTime);
  }
}
