// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_type_dynamic.g.dart';

const String tblConversationTypes = 'tblConversationTypes';

class ConversationTypeDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    conversationTypeId, conversationTypeName,
  ];
  static const String conversationTypeId = 'conversation_type_id';
  static const String conversationTypeName = 'conversation_type_name';
}

@JsonSerializable()
class ConversationTypeDynamic extends Equatable {
  final int? conversationTypeId;
  final String conversationTypeName;

  const ConversationTypeDynamic({
    this.conversationTypeId,
    required this.conversationTypeName,
  });

  ConversationTypeDynamic copy({
    int? conversationTypeId,
    String? conversationTypeName,
  }) =>
      ConversationTypeDynamic(
        conversationTypeId: conversationTypeId ?? this.conversationTypeId,
        conversationTypeName: conversationTypeName ?? this.conversationTypeName,
      );

  factory ConversationTypeDynamic.fromJson(Map<String, dynamic> json) =>
      _$ConversationTypeDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationTypeDynamicToJson(this);

  @override
  List<Object?> get props => [
        conversationTypeId,
        conversationTypeName,
      ];

  @override
  String toString() {
    return 'tblConversationTypes(conversation_type_id: $conversationTypeId, conversation_type_name: $conversationTypeName)';
  }
}
