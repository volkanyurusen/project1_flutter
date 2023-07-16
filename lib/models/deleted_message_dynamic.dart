// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'deleted_message_dynamic.g.dart';

const String tblDeletedMessages = 'tblDeletedMessages';

class DeletedMessageDynamicFields {
  static final List<String> values = [
    deletedMessageId,
    messageId,
    deletedBy,
    deletedAt,
  ];

  static const String deletedMessageId = 'deleted_message_id';
  static const String messageId = 'message_id';
  static const String deletedBy = 'deleted_by';
  static const String deletedAt = 'deleted_at';
}

@JsonSerializable()
class DeletedMessageDynamic extends Equatable {
  final int? deletedMessageId;
  final MessageDynamic messageDynamic;
  final UserDynamic deletedBy;
  final DateTime deletedAt;

  DeletedMessageDynamic({
    this.deletedMessageId,
    required this.messageDynamic,
    required this.deletedBy,
    DateTime? deletedAt,
  }) : deletedAt = deletedAt ?? DateTime.now();

  DeletedMessageDynamic copy({
    int? deletedMessageId,
    MessageDynamic? messageDynamic,
    UserDynamic? deletedBy,
    DateTime? deletedAt,
  }) =>
      DeletedMessageDynamic(
        deletedMessageId: deletedMessageId ?? this.deletedMessageId,
        messageDynamic: messageDynamic ?? this.messageDynamic,
        deletedBy: deletedBy ?? this.deletedBy,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory DeletedMessageDynamic.fromJson(Map<String, dynamic> json) =>
      _$DeletedMessageDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedMessageDynamicToJson(this);

  @override
  List<Object?> get props => [
        deletedMessageId,
        messageDynamic,
        deletedBy,
        deletedAt,
      ];

  @override
  String toString() {
    return 'tblDeletedMessages(deleted_message_id: $deletedMessageId, message_id: $messageDynamic, deleted_by: $deletedBy, deleted_at: $deletedAt)';
  }
}
