// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DBStatus _$DBStatusFromJson(Map<String, dynamic> json) => DBStatus(
      id: json['id'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DBStatusToJson(DBStatus instance) => <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };
