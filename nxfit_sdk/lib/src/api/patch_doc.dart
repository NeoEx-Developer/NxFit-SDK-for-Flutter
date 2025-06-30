import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart'; // For @immutable (optional but good practice)

part 'patch_doc.g.dart';

@immutable
@JsonSerializable(createToJson: true)
class PatchDocOperation {
  final String op;
  final String path;
  final String? from;
  final String? value;

  const PatchDocOperation({
    required this.op,
    required this.path,
    this.from,
    this.value,
  });

  Map<String, dynamic> toJson() => _$PatchDocOperationToJson(this);

  // For better debugging and if you need equals/hashCode for comparisons
  @override
  String toString() {
    return 'PatchDocOperation{op: $op, path: $path, from: $from, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PatchDocOperation &&
              runtimeType == other.runtimeType &&
              op == other.op &&
              path == other.path &&
              from == other.from &&
              value == other.value;

  @override
  int get hashCode =>
      op.hashCode ^ path.hashCode ^ from.hashCode ^ value.hashCode;
}

@immutable
class PatchDoc {
  final List<PatchDocOperation> operations; // Using dynamic for <Any> equivalent

  const PatchDoc(this.operations);

  // For better debugging and if you need equals/hashCode for comparisons
  @override
  String toString() {
    return 'PatchDoc{operations: $operations}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PatchDoc &&
              runtimeType == other.runtimeType &&
              // Note: Deep equality check for lists might be needed depending on usage
              // For simplicity, this checks reference or if they are both the same list.
              // For true deep equality, you might use collection.DeepCollectionEquality()
              // from the 'package:collection/collection.dart' package.
              // For now, let's assume the list content comparison is handled if operations themselves are compared.
              _listEquals(operations, other.operations);


  // Helper for list equality if using built-in List.== which is identity
  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }


  @override
  int get hashCode {
    // A simple way to combine hashCodes for a list.
    // For more robust list hashing, consider iterating or using a utility.
    int result = 17;
    result = 31 * result + operations.fold(0, (prev, element) => prev ^ element.hashCode);
    return result;
  }
}

class PatchDocBuilder {
  final List<PatchDocOperation> _ops = [];

  int get opCount => _ops.length;
  bool get hasOperations => opCount > 0;

  PatchDocBuilder replaceString(String path, String value) {
    _ops.add(PatchDocOperation(
      op: "replace",
      path: path,
      value: value,
      from: null,
    ));
    return this;
  }

  PatchDocBuilder replaceInt(String path, int value) {
    _ops.add(PatchDocOperation(
      op: "replace",
      path: path,
      value: "$value",
      from: null,
    ));
    return this;
  }

  PatchDocBuilder replaceBool(String path, bool value) {
    _ops.add(PatchDocOperation(
      op: "replace",
      path: path,
      value: value ? "true" : "false",
      from: null,
    ));
    return this;
  }


  PatchDocBuilder remove(String path) {
    _ops.add(PatchDocOperation( // Using dynamic as value is null
      op: "remove",
      path: path,
    ));
    return this;
  }

  PatchDoc build() {
    return PatchDoc(List.unmodifiable(_ops)); // Return an unmodifiable list
  }
}
