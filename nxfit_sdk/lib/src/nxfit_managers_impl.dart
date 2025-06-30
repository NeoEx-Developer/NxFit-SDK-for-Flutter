part of "nxfit_managers.dart";

class _NxFitManagersImpl extends NxFitManagers {
  @override
  final NxFit nxfit;

  @override
  final IntegrationsManager integrationsManager;

  _NxFitManagersImpl(
    this.nxfit, {
    required this.integrationsManager,
  });
}
