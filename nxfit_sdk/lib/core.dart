/// The core of the NxFit SDK for Flutter.
///
/// To get started, look at the [NxFit] class, which is the entry point to the SDK. To instantiate an instance of the NxFit class
/// use the [NxFit.build] method. This will provide the NxFit clients, which are used to access the NxFit API service over HTTP.
library core;

export 'src/auth/auth_provider.dart';
export 'src/auth/auth_state.dart';
export 'src/config/configuration_provider.dart';
export 'src/config/http_logger_level.dart';
export 'src/exceptions/conflict_exception.dart';
export 'src/exceptions/network_exception.dart';
export 'src/exceptions/not_modified_exception.dart';
export 'src/exceptions/unauthorized_exception.dart';
export 'src/nxfit.dart';
export "src/nxfit_managers.dart";
export "src/nxfit_repositories.dart";
export 'src/pagination/paged_list.dart';
export 'src/pagination/pagination_request.dart';
export 'src/persistence/cacheable.dart';
export 'src/persistence/cacheable_resource.dart';
