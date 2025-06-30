import 'dart:async';

extension StreamExtensions<T> on Stream<T> {
  Stream<T> onFirst(Function(T) firstAction) {
    var isFirst = true;

    return map((x) {
      if (isFirst) {
        isFirst = false;
        firstAction(x);
      }

      return x;
    });
  }
}
