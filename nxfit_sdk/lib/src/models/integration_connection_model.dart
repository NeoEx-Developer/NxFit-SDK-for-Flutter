import 'package:meta/meta.dart';

/// Model returned when an integration is connected, containing the authorization URL.
@immutable
class IntegrationConnectedModel {
  final String? authorizeUrl;

  const IntegrationConnectedModel({
    this.authorizeUrl,
  });
}
