# NxFit SDK for Flutter

*NxFit SDK for Flutter* provides access to the NxFit REST API to retrieve user health data from the NxFit service. The SDK provides *clients*, which contain convenience methods to make HTTP calls to the NxFit API. Models for all the NxFit entities are also provided.

To further assist in adoption of the SDK, *managers* and *repositories* are also provided that use caching to improve performance. The NxFit SDK requires the consuming application to provide a user ID and an access token via the [AuthProvider](auth_auth_provider/AuthProvider-class.html) interface.

## Features

* **Clients** provide methods to make HTTP calls to the NxFit API service.
* **Managers** provide caching of data via a sync process. The app always reads data from local storage and it is kept fresh via the sync process.
* **Repositories** cache response data from the server. As data is read from the server, subsequent calls may rely on locally cached data.
* **Models** are provided to easily work with the health data.

## Add NxFit SDK to your project

In your project's `pubspec.yaml` file
* Add the latest version of *NxFit SDK* to your *dependencies*.

```yaml
# pubspec.yaml

dependencies:
  nxfit_sdk: ^0.1.0
```

## Getting started

The entry into the NxFit SDK is the [NxFit](nxfit/NxFit-class.html) class. It can be instantiated using the static method [NxFit.build](nxfit/NxFit/build.html). To build an instance of the [NxFit](nxfit/NxFit-class.html) class an instance of both [ConfigurationProvider](configuration_provider/ConfigurationProvider-class.html) and [AuthProvider](auth_auth_provider/AuthProvider-class.html) are required.

## Usage

```dart
  final configProvider = ConfigurationProvider(
    "https://api.nxfit.io/", // Base URL
    httpLoggerLevel: HttpLoggerLevel.body, // Log request and response bodies
    minLogLevel: LogLevel.info, // Only log info, warnings, and errors
    connectTimeoutSeconds: 20, // 20 second connection timeout
  );
  
  // AuthManager implements AuthProvider
  final authManager = AuthManager();
  
  final nxfit = NxFit.build(configProvider, authProvider);
  final nxfitRepos = await NxFitRepositories.build(nxfit);
  final nxfitManagers = await NxFitManagers.build(nxfit, baseRedirectUri: "YOUR_BASE_URL");

  // Get the user's sessions for the day
  final sessions = await nxfit.sessionClient.list();

  // get a particular session for a particular user.
  final session = await nxfit.sessionClient.getForUser(userId, sessionId);
```
