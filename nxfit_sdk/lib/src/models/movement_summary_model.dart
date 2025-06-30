import 'package:meta/meta.dart';

@immutable
class MovementSummaryModel {
  final int currentMovementInSeconds;
  final int movementGoalInSeconds;

  const MovementSummaryModel(this.currentMovementInSeconds, this.movementGoalInSeconds);

  @override
  String toString() => "currentMovementInSeconds: $currentMovementInSeconds movementGoalInSeconds: $movementGoalInSeconds";
}