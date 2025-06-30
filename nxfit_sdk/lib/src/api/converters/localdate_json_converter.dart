import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@internal
@immutable
class LocalDateJsonConverter extends JsonConverter<LocalDate, String> {
  const LocalDateJsonConverter();

  @override
  LocalDate fromJson(String json) {
    return LocalDate.dateTime(DateTime.parse(json));
  }

  @override
  String toJson(LocalDate date) {
    return date.toString("uuuu'-'MM'-'dd");
  }
}