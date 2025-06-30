import 'package:meta/meta.dart';

@internal
class QuotedString {
  final String? _value;

  QuotedString(this._value);

  @override String toString() {
    return "\"${_value ?? ""}\"";
  }

  static final _regx = RegExp("^\"|\"\$");
  static String unquoteString(String st) {
    return st.replaceAllMapped(_regx, (match) => "");
  }
}

@internal
extension QuotedStringExtensions on String {
  QuotedString toQuotedString() {
    return QuotedString(this);
  }
}
