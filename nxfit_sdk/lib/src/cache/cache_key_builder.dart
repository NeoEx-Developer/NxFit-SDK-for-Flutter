import 'package:time_machine/time_machine.dart';

enum CacheCategory implements Comparable<CacheCategory> {
  IntegrationList("ingrns"),
  SessionList("ssnSmrys"),
  HeartRateSummaryList("hrzSmrys"),
  HeartRateSummarySampleList("hrss"),
  BadgeList("bdgs"),
  SessionLocationSampleList("ssnLctn"),
  Source("src"),
  SourceList("srcs");

  const CacheCategory(this.value);

  final String value;

  @override
  int compareTo(CacheCategory other) => value.compareTo(other.value);
}

class CacheKeyBuilder {
  final CacheCategory cacheCategory;
  final List<String> _params = [];

  CacheKeyBuilder(this.cacheCategory);

  CacheKeyBuilder addString(String param) {
    _params.add(param);
    return this;
  }

  CacheKeyBuilder addInt(int param) {
    return addString("${param}");
  }

  CacheKeyBuilder addOffsetDateTime(OffsetDateTime param) {
    return addInt(param.toInstant().epochSeconds);
  }

  String build() {
    final buffer = StringBuffer();

    _params.forEach((p) {
      if (buffer.isNotEmpty) buffer.write("|");
      buffer.write(p);
    });

    return "${cacheCategory.value}:${buffer.toString()}";
  }

  @override
  String toString() => build();
}
