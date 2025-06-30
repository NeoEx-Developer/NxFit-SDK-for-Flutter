/// A [Cacheable] provides a mechanism for caching based on HTTP response headers.
abstract class Cacheable {
  /// The last time the cacheable was modified. This is retrieved from the **Last-Modified** HTTP Header.
  final DateTime? lastModifiedOn;

  /// The ETag (Entity Tag) of the cacheable. This is retrieved from the **ETag** HTTP Header.
  final String? eTag;

  Cacheable({this.lastModifiedOn, this.eTag});
}
