import 'package:intl/intl.dart';

class Util {
  static String appId = "b502286d37f0575de17f2ed14404d502";

  static String getFormatDate(DateTime dateTime) {
    return new DateFormat("EEE, MMM d, y")
        .format(dateTime); //this is to format date
  }
}
