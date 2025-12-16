# NxFit SDK for Flutter - Changelog

## 0.3.1

* Fixed issue where the `IntegrationsManager` was not always emitting the list of `integrations`.

## 0.3.0

* **Breaking Change**: Renamed all properties that contained energy values to be in Kilocalories instead of Calories.  

## 0.2.0
 
* **Breaking Change**: Removed the `minLogLevel` parameter from `setBasicLogger`, as the log level is now configured directly on the logger itself.

## 0.1.0

* Refactored logging system with new `minLogLevel` configuration option.
* Updated dependencies to resolve build issues.

## 0.0.9

* Added `canHandle` helper method to `IntegrationsManager` for checking if an integration can be handled.

## 0.0.8

* **Breaking Change**: Refactored local integration ready state from enum to `bool` stream for improved clarity and ease of use.

## 0.0.7

* Added ready state support for local integrations.

## 0.0.6

* Added JSON annotations and helper methods to `LocalIntegration` model.
* Refactored `IntegrationsManager` implementation for improved local integration handling.
* **Breaking Change**: Removed sync functions from `IntegrationsManager`.
* **Breaking Change**: Removed `isEnabled` property from `Integration` model and replaced with `availability` property.
* **Breaking Change**: Removed redundant integration repository.
* Added new exception classes (`ConflictException`, `NetworkException`, `UnauthorizedException`, `NotModifiedException`).
* Updated API caller implementation to use new exception classes.

## 0.0.5

* Fixed issue with local integration API response handling.

## 0.0.4

* Replaced Floor database library with Froom for improved local database support.
* Added `connect` method to `IntegrationClient` for establishing integration connections.
* Refactored `IntegrationsManager.connect` method.
* Updated minimum Java version requirement from 8 to 17.
* Updated dependencies.

## 0.0.3

* **Breaking Change**: Renamed `activityId` to `externalId` in session models for improved clarity.
* Removed `activityId` property from session and update session methods.

## 0.0.2

* Code cleanup and documentation improvements.
* Added repository URL to package metadata.

## 0.0.1

* Initial preview release.
