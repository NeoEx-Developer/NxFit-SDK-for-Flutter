import 'package:meta/meta.dart';
import 'package:time_machine/time_machine.dart';

@immutable
class BadgeModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double progress;
  final OffsetDateTime? startedOn;
  final OffsetDateTime? endedOn;
  final OffsetDateTime? completedOn;

  const BadgeModel(
      this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.progress,
      this.startedOn,
      this.endedOn,
      this.completedOn
  );

  @override
  String toString() {
    return "BadgeModel: id: $id title: $title description: $description imageUrl: $imageUrl progress: $progress startedOn: $startedOn endedOn: $endedOn completedOn: $completedOn";
  }
}

extension BadgeModelExtensions on BadgeModel {
  bool get isComplete {
    return completedOn != null;
  }

  bool get hasEnded {
    if (endedOn == null) return false;

    var now = DateTime.now().toUtc().millisecondsSinceEpoch;

    return endedOn!.toInstant().toDateTimeUtc().millisecondsSinceEpoch < now;
  }
}