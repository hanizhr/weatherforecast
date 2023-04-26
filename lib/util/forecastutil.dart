import 'package:intl/intl.dart';

class Util{
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";//ed60fcfbd110ee65c7150605ea8aceea
  static String getFormattedData(DateTime dateTime) {
    return new DateFormat('EEEE, dd MMM').format(dateTime);
  }

}