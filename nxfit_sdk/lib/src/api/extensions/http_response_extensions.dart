import 'package:meta/meta.dart';
import 'package:retrofit/retrofit.dart';

import '../../persistence/cacheable_resource.dart';
import 'response_extensions.dart';


@internal
extension HttpResponseExtensions<Tdto> on HttpResponse<Tdto> {
  CacheableResource<Tmodel> asCacheableResource<Tmodel>(Tmodel Function(Tdto) modelMapper) {
    final model = modelMapper(data);
    return CacheableResource<Tmodel>(model, lastModifiedOn:  response.getLastModifier(), eTag: response.getETag());
  }
}
