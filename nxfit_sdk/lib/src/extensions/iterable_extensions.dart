extension IterableExtensions<T> on Iterable<T> {
  Iterable<T> tap(void Function(T) action) {
    for (var i in this) {
      action(i);
    }

    return this;
  }

  Future<Iterable<T>> tapAsync(Future<void> Function(T) action) async {
    for (var i in this) {
      await action(i);
    }

    return this;
  }
}
