import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@internal
@immutable
class OffsetDateTimeJsonConverter extends JsonConverter<OffsetDateTime, String> {
  static final _regexp = RegExp(r'^(?<plusMinus>[+-]?)(?<hours>[\d][\d]):(?<minutes>[\d][\d])');

  const OffsetDateTimeJsonConverter();

  @override
  OffsetDateTime fromJson(String json) {
    final match = _regexp.firstMatch(json.substring(json.length-6));
    final multiplier = match!.namedGroup("plusMinus") == "+" ? 1 : -1;

    final offsetDuration = Duration(
        hours: int.parse(match.namedGroup('hours')!) * multiplier,
        minutes: int.parse(match.namedGroup('minutes')!)
    );

    var localDateTime = LocalDateTime.dateTime(DateTime.parse(json.substring(0, json.length-6)));

    return OffsetDateTime(localDateTime, Offset.duration(offsetDuration));
  }

  @override
  String toJson(OffsetDateTime date) {
    return date.toString("uuuu'-'MM'-'dd'T'HH':'mm':'sso<Z+HH:mm>");
  }
}