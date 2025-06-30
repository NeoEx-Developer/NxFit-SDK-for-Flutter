import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@internal
@immutable
class LocalDateTimeJsonConverter extends JsonConverter<LocalDateTime, String> {
//  static final _regexp = RegExp(r'^(?<plusMinus>[+-]?)(?<hours>[\d][\d]):(?<minutes>[\d][\d])');

  const LocalDateTimeJsonConverter();

  @override
  LocalDateTime fromJson(String json) {
    return LocalDateTime.dateTime(DateTime.parse(json.substring(0, json.length-6)));
  }

  @override
  String toJson(LocalDateTime date) {
    return date.toString("uuuu'-'MM'-'dd'T'HH':'mm':'sso");
  }
}