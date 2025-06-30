import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';
import 'package:time_machine/time_machine_text_patterns.dart';

@internal
@immutable
class ZonedDateTimeJsonConverter extends JsonConverter<ZonedDateTime, String> {
  const ZonedDateTimeJsonConverter();

  @override
  ZonedDateTime fromJson(String json) {
    return ZonedDateTimePattern.generalFormatOnlyIso.parse(json).value;
  }

  @override
  String toJson(ZonedDateTime date) {
    return ZonedDateTimePattern.generalFormatOnlyIso.format(date);
  }
}

// extension ZonedDateTimeExtensions on ZonedDateTime {
//   DateTime from(String date) {
//     final int SP = 32;
//     const List wkdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
//     const List weekdays = [
//       "Monday",
//       "Tuesday",
//       "Wednesday",
//       "Thursday",
//       "Friday",
//       "Saturday",
//       "Sunday"
//     ];
//     const List months = [
//       "Jan",
//       "Feb",
//       "Mar",
//       "Apr",
//       "May",
//       "Jun",
//       "Jul",
//       "Aug",
//       "Sep",
//       "Oct",
//       "Nov",
//       "Dec"
//     ];
//
//     final int formatRfc1123 = 0;
//     final int formatRfc850 = 1;
//     final int formatAsctime = 2;
//
//     int index = 0;
//     String tmp;
//
//     void expect(String s) {
//       if (date.length - index < s.length) {
//         throw HttpException("Invalid HTTP date $date");
//       }
//       String tmp = date.substring(index, index + s.length);
//       if (tmp != s) {
//         throw HttpException("Invalid HTTP date $date");
//       }
//       index += s.length;
//     }
//
//     int expectWeekday() {
//       int weekday;
//       // The formatting of the weekday signals the format of the date string.
//       int pos = date.indexOf(",", index);
//       if (pos == -1) {
//         int pos = date.indexOf(" ", index);
//         if (pos == -1) throw HttpException("Invalid HTTP date $date");
//         tmp = date.substring(index, pos);
//         index = pos + 1;
//         weekday = wkdays.indexOf(tmp);
//         if (weekday != -1) {
//           return formatAsctime;
//         }
//       } else {
//         tmp = date.substring(index, pos);
//         index = pos + 1;
//         weekday = wkdays.indexOf(tmp);
//         if (weekday != -1) {
//           return formatRfc1123;
//         }
//         weekday = weekdays.indexOf(tmp);
//         if (weekday != -1) {
//           return formatRfc850;
//         }
//       }
//       throw HttpException("Invalid HTTP date $date");
//     }
//
//     int expectMonth(String separator) {
//       int pos = date.indexOf(separator, index);
//       if (pos - index != 3) throw HttpException("Invalid HTTP date $date");
//       tmp = date.substring(index, pos);
//       index = pos + 1;
//       int month = months.indexOf(tmp);
//       if (month != -1) return month;
//       throw HttpException("Invalid HTTP date $date");
//     }
//
//     int expectNum(String separator) {
//       int pos;
//       if (separator.isNotEmpty) {
//         pos = date.indexOf(separator, index);
//       } else {
//         pos = date.length;
//       }
//       String tmp = date.substring(index, pos);
//       index = pos + separator.length;
//       try {
//         int value = int.parse(tmp);
//         return value;
//       } on FormatException {
//         throw HttpException("Invalid HTTP date $date");
//       }
//     }
//
//     void expectEnd() {
//       if (index != date.length) {
//         throw HttpException("Invalid HTTP date $date");
//       }
//     }
//
//     int format = expectWeekday();
//     int year;
//     int month;
//     int day;
//     int hours;
//     int minutes;
//     int seconds;
//     if (format == formatAsctime) {
//       month = expectMonth(" ");
//       if (date.codeUnitAt(index) == SP) index++;
//       day = expectNum(" ");
//       hours = expectNum(":");
//       minutes = expectNum(":");
//       seconds = expectNum(" ");
//       year = expectNum("");
//     } else {
//       expect(" ");
//       day = expectNum(format == formatRfc1123 ? " " : "-");
//       month = expectMonth(format == formatRfc1123 ? " " : "-");
//       year = expectNum(" ");
//       hours = expectNum(":");
//       minutes = expectNum(":");
//       seconds = expectNum(" ");
//       expect("GMT");
//     }
//
//     expectEnd();
//
//     return DateTime.utc(year, month + 1, day, hours, minutes, seconds, 0);
//   }
// }