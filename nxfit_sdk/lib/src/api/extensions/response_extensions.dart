
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../helpers/quoted_string.dart';

@internal
extension ReponseExtensions<T> on Response<T> {
  DateTime? getLastModifier() {
    // For some reason, on the Web platform the Last-Modifed date is split into an array. This is likely
    // because the last modified value contains a comma and either the browser or the DIO library are tricked
    // into thinking it's an array of values. So we join the array using a comma as a separator.
    final lastModified = headers["Last-Modified"]?.join(",");

    if (lastModified == null || lastModified.isEmpty) return null;

    if (kDebugMode) {
      print("Last-Modified: $lastModified  Count: ${headers["Last-Modified"]?.length}");
    }

    return HttpDate.parse(lastModified);
  }

  String? getETag() {
    final etag = this.headers.value("ETag");

    if (etag == null) return null;

    return QuotedString.unquoteString(etag!);
  }
}
