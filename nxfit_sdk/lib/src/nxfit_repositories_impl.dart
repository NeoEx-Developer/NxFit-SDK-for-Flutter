part of "nxfit_repositories.dart";

class _NxFitRepositoriesImpl implements NxFitRepositories {
  @override
  final NxFit nxfit;

  @override
  final BadgeRepository badgeRepo;

  @override
  final ProfileRepository profileRepo;

  @override
  final SessionRepository sessionRepo;

  @override
  final SessionSampleRepository sessionSampleRepo;

  @override
  final SessionSummaryRepository sessionSummaryRepo;

  @override
  final SourceRepository sourceRepo;

  _NxFitRepositoriesImpl(this.nxfit, {
    required this.badgeRepo,
    required this.profileRepo,
    required this.sessionRepo,
    required this.sessionSampleRepo,
    required this.sessionSummaryRepo,
    required this.sourceRepo
  });
}