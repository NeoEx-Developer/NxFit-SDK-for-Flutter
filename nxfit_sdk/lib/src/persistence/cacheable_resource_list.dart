import 'cacheable_resource.dart';

/// Encapsulates a cacheable list
///
/// See also [Cacheable] and [CacheableResource].
class CacheableResourceList<T> extends CacheableResource<List<T>>
{
  CacheableResourceList(List<T> value, {DateTime? lastModifiedOn, String? eTag}) : super(value, lastModifiedOn: lastModifiedOn, eTag: eTag);
}
