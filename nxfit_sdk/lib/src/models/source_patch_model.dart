/// A model representing a source patch.
class SourcePatchModel {
  int sourceId;
  int? priority;
  bool? isIncluded;

  /// At least one of the [priority] or [isIncluded] properties must be provided.
  ///
  /// Throw [Exception] if at least one property isn't supplied.
  SourcePatchModel(this.sourceId, {required this.priority, required this.isIncluded}) {
    if (priority == null && isIncluded == null) throw Exception("At least one of priority or isIncluded must be provided");
  }
}
