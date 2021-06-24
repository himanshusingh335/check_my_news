// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    value: (json['value'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'value': instance.value,
    };
