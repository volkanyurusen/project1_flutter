// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'conversation_type.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblConversationTypes = 'tblConversationTypes';

class ConversationTypeFields {
  static final List<String> values = [
    /// Add all fields here
    conversationTypeId, conversationTypeName, createdAt, deactivatedAt,
    updatedAt, isActive,
  ];

  static const String conversationTypeId = 'conversation_type_id';
  static const String conversationTypeName = 'conversation_type_name';
  static const String createdAt = 'created_at';
  static const String deactivatedAt = 'deactivated_at';
  static const String updatedAt = 'updated_at';
  static const String isActive = 'is_active';
}

/// conversationType -second variable- was created to show which kind of
/// conversation the relevant conversation is. 3 types of conversations exist
/// and they are below. The last 2 types will be activated later when coaching
/// is broadcasted.
///
/// about consisted activity
/// about coaching
/// about training request
///
// @JsonSerializable()
class ConversationType extends Equatable {
  final int? conversationTypeId;
  final String conversationTypeName;
  final DateTime createdAt;
  final DateTime? deactivatedAt;
  final DateTime? updatedAt;
  final bool isActive;

  ConversationType({
    this.conversationTypeId,
    required this.conversationTypeName,
    DateTime? createdAt,
    this.deactivatedAt,
    this.updatedAt,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now();

  ConversationType copy({
    int? conversationTypeId,
    String? conversationTypeName,
    DateTime? createdAt,
    DateTime? deactivatedAt,
    DateTime? updatedAt,
    bool? isActive,
  }) =>
      ConversationType(
        conversationTypeId: conversationTypeId ?? this.conversationTypeId,
        conversationTypeName: conversationTypeName ?? this.conversationTypeName,
        createdAt: createdAt ?? this.createdAt,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isActive: isActive ?? this.isActive,
      );

  factory ConversationType.fromJson(Map<String, dynamic> json) =>
      _$ConversationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationTypeToJson(this);

  @override
  List<Object?> get props => [
        conversationTypeId,
        conversationTypeName,
        createdAt,
        deactivatedAt,
        updatedAt,
        isActive,
      ];

  @override
  String toString() {
    return 'tblConversationTypes(conversation_type_id: $conversationTypeId, conversation_type_name: $conversationTypeName, created_at: $createdAt, deactivated_at: $deactivatedAt, updated_at: $updatedAt, is_active: $isActive)';
  }
}

// ConversationType fromMap(Map<String, dynamic> json) => ConversationType(
//       conversationTypeId:
//           json[ConversationTypeFields.conversationTypeId] as int?,
//       conversationTypeName:
//           json[ConversationTypeFields.conversationTypeName] as String,
//       createdAt:
//           DateTime.parse(json[ConversationTypeFields.createdAt] as String),
//       deactivatedAt:
//           DateTime.parse(json[ConversationTypeFields.deactivatedAt] as String),
//       updatedAt:
//           DateTime.parse(json[ConversationTypeFields.updatedAt] as String),
//       isActive: json[ConversationTypeFields.isActive] == 1,
//     );

// Map<String, dynamic> toMap() => {
//       ConversationTypeFields.conversationTypeId: conversationTypeId,
//       ConversationTypeFields.conversationTypeName: conversationTypeName,
//       ConversationTypeFields.createdAt: createdAt.toIso8601String(),
//       ConversationTypeFields.deactivatedAt: deactivatedAt?.toIso8601String(),
//       ConversationTypeFields.updatedAt: updatedAt?.toIso8601String(),
//       ConversationTypeFields.isActive: isActive ? 1 : 0,
//     };
