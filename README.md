# NxFit SDK for Flutter

*NxFit SDK for Flutter* provides access to the NxFit REST API to retrieve user health data from the NxFit service. The SDK provides *clients*, which contain convenience methods to make HTTP calls to the NxFit API. Models for all the NxFit entities are also provided.

To further assist in adoption of the SDK, *managers* and *repositories* are also provided that use caching to improve performance. The NxFit SDK requires the consuming application to provide a user ID and an access token via the [AuthProvider](auth_auth_provider/AuthProvider-class.html) interface.

# Generate Serializer/Deserializer and API code run:
- flutter pub run build_runner build  
...or, the new way...  
- dart run build_runner build

# Manage generated files:
### List all generated files:
**bash:** find . -name "*.g.dart" -type f

### Remove generated files:
**bash:** find . -name "*.g.dart" -type f -delete

# Build and Test

nxfit: flutter build web -t lib/main_dev.dart

nxfit: flutter test test/nxfit_test.dart
nxfit_sdk: flutter test test/nxfit_sdk_test.dart
