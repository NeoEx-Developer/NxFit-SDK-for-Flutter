// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchDocOperation _$PatchDocOperationFromJson(Map<String, dynamic> json) =>
    PatchDocOperation(
      op: json['op'] as String,
      path: json['path'] as String,
      from: json['from'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PatchDocOperationToJson(PatchDocOperation instance) =>
    <String, dynamic>{
      'op': instance.op,
      'path': instance.path,
      'from': instance.from,
      'value': instance.value,
    };
