import 'package:flutter_test/flutter_test.dart';
import 'package:nxfit_sdk/src/api/helpers/quoted_string.dart';
import 'package:nxfit_sdk/src/api/converters/offsetdatetime_json_converter.dart';

void miscTests() {
  test("Test OffsetDateTime converter", () {
    const datestamp = "2002-02-27T14:15:01-05:00";
    const year = 2002;
    const month = 2;
    const day = 27;
    const hour = 14;
    const minute = 15;
    const second = 1;
    const offsetHour = -5;
    const offsetMinute = 0;

    var offsetDateTime = OffsetDateTimeJsonConverter().fromJson(datestamp);

//    print(offsetDateTime.toString());

    expect(year, offsetDateTime.year);
    expect(month, offsetDateTime.monthOfYear);
    expect(day, offsetDateTime.dayOfMonth);
    expect(hour, offsetDateTime.hourOfDay);
    expect(minute, offsetDateTime.minuteOfHour);
    expect(second, offsetDateTime.secondOfMinute);
    expect(offsetHour, offsetDateTime.offset.toDuration().inHours);
    expect(offsetHour * 60 + offsetMinute, offsetDateTime.offset.toDuration().inMinutes);

//    print(OffsetDateTimeJsonConverter().toJson(offsetDateTime));

    final st = const OffsetDateTimeJsonConverter().toJson(offsetDateTime);
    expect(datestamp, st);
  });

  test("QuotedString.unquoteString works", () {
    final st = QuotedString.unquoteString("\"blah\"");

    expect("blah", st);
  });

}
