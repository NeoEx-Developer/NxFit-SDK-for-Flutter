import 'cacheable.dart';

/// Encapsulates a resource that can be cached via an [eTag] and [lastModifiedOn]. The resource can be any type, however how the
/// resource is cached is up to the caller.
///
/// See also [Cacheable]
class CacheableResource<T> extends Cacheable {
  /// The resource to be cached.
  final T value;

  CacheableResource(this.value, {DateTime? lastModifiedOn, String? eTag}) : super(lastModifiedOn: lastModifiedOn, eTag: eTag);
}
