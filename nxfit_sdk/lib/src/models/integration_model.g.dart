// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IntegrationModelCWProxy {
  IntegrationModel identifier(String identifier);

  IntegrationModel displayName(String displayName);

  IntegrationModel logoUrl(String logoUrl);

  IntegrationModel isConnected(bool isConnected);

  IntegrationModel availability(IntegrationAvailability availability);

  IntegrationModel lastModifiedOn(OffsetDateTime? lastModifiedOn);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `IntegrationModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// IntegrationModel(...).copyWith(id: 12, name: "My name")
  /// ```
  IntegrationModel call({
    String identifier,
    String displayName,
    String logoUrl,
    bool isConnected,
    IntegrationAvailability availability,
    OffsetDateTime? lastModifiedOn,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfIntegrationModel.copyWith(...)` or call `instanceOfIntegrationModel.copyWith.fieldName(value)` for a single field.
class _$IntegrationModelCWProxyImpl implements _$IntegrationModelCWProxy {
  const _$IntegrationModelCWProxyImpl(this._value);

  final IntegrationModel _value;

  @override
  IntegrationModel identifier(String identifier) =>
      call(identifier: identifier);

  @override
  IntegrationModel displayName(String displayName) =>
      call(displayName: displayName);

  @override
  IntegrationModel logoUrl(String logoUrl) => call(logoUrl: logoUrl);

  @override
  IntegrationModel isConnected(bool isConnected) =>
      call(isConnected: isConnected);

  @override
  IntegrationModel availability(IntegrationAvailability availability) =>
      call(availability: availability);

  @override
  IntegrationModel lastModifiedOn(OffsetDateTime? lastModifiedOn) =>
      call(lastModifiedOn: lastModifiedOn);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `IntegrationModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// IntegrationModel(...).copyWith(id: 12, name: "My name")
  /// ```
  IntegrationModel call({
    Object? identifier = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? logoUrl = const $CopyWithPlaceholder(),
    Object? isConnected = const $CopyWithPlaceholder(),
    Object? availability = const $CopyWithPlaceholder(),
    Object? lastModifiedOn = const $CopyWithPlaceholder(),
  }) {
    return IntegrationModel(
      identifier:
          identifier == const $CopyWithPlaceholder() || identifier == null
          ? _value.identifier
          // ignore: cast_nullable_to_non_nullable
          : identifier as String,
      displayName:
          displayName == const $CopyWithPlaceholder() || displayName == null
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String,
      logoUrl: logoUrl == const $CopyWithPlaceholder() || logoUrl == null
          ? _value.logoUrl
          // ignore: cast_nullable_to_non_nullable
          : logoUrl as String,
      isConnected:
          isConnected == const $CopyWithPlaceholder() || isConnected == null
          ? _value.isConnected
          // ignore: cast_nullable_to_non_nullable
          : isConnected as bool,
      availability:
          availability == const $CopyWithPlaceholder() || availability == null
          ? _value.availability
          // ignore: cast_nullable_to_non_nullable
          : availability as IntegrationAvailability,
      lastModifiedOn: lastModifiedOn == const $CopyWithPlaceholder()
          ? _value.lastModifiedOn
          // ignore: cast_nullable_to_non_nullable
          : lastModifiedOn as OffsetDateTime?,
    );
  }
}

extension $IntegrationModelCopyWith on IntegrationModel {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfIntegrationModel.copyWith(...)` or `instanceOfIntegrationModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IntegrationModelCWProxy get copyWith => _$IntegrationModelCWProxyImpl(this);
}
