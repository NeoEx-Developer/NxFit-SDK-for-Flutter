enum IntegrationAvailability {
  /// The integration is available and can be connected.
  available("available"),

  /// The integration is not currently available.
  /// For Health Connect, the Health Connect app is not currently installed, but needs to be, before this integration can be connected on this device.
  unavailable("unavailable"),

  /// The integration is not supported on the device.
  /// For Health Connect, this means the Health Connect app is not installed and cannot be installed therefore this integration cannot be connected on this device.
  unsupported("unsupported");

  final String value;

  const IntegrationAvailability(this.value);
}
