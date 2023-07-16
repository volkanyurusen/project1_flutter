// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_request_conversation_dynamic.g.dart';

const String tblTrainingRequestConversationDynamicss =
    'tblTrainingRequestConversationDynamicss';

class TrainingRequestConversationDynamicFields {
  static final List<String> values = [
    trainingRequestConversationId,
    conversationTypeId,
    trainingRequestResponseId,
    dateOfParticipation,
    deactivatedAt,
  ];
  static const String trainingRequestConversationId =
      'training_request_conversation_id';
  static const String conversationTypeId = 'conversation_type_id';
  static const String trainingRequestResponseId =
      'training_request_response_id';
  static const String dateOfParticipation = 'date_of_participation';
  static const String deactivatedAt = 'deactivated_at';
}

@JsonSerializable()
class TrainingRequestConversationDynamic extends Equatable {
  final int? trainingRequestConversationId;
  final ConversationTypeDynamic conversationTypeDynamic;
  final TrainingRequestResponseDynamic trainingRequestResponseDynamic;
  final DateTime dateOfParticipation;
  final DateTime? deactivatedAt;

  const TrainingRequestConversationDynamic({
    this.trainingRequestConversationId,
    required this.conversationTypeDynamic,
    required this.trainingRequestResponseDynamic,
    required this.dateOfParticipation,
    this.deactivatedAt,
  });

  TrainingRequestConversationDynamic copy({
    int? trainingRequestConversationId,
    ConversationTypeDynamic? conversationTypeDynamic,
    TrainingRequestResponseDynamic? trainingRequestResponseDynamic,
    DateTime? dateOfParticipation,
    DateTime? deactivatedAt,
  }) =>
      TrainingRequestConversationDynamic(
        trainingRequestConversationId:
            trainingRequestConversationId ?? this.trainingRequestConversationId,
        conversationTypeDynamic:
            conversationTypeDynamic ?? this.conversationTypeDynamic,
        trainingRequestResponseDynamic: trainingRequestResponseDynamic ??
            this.trainingRequestResponseDynamic,
        dateOfParticipation: dateOfParticipation ?? this.dateOfParticipation,
        deactivatedAt: deactivatedAt ?? this.deactivatedAt,
      );

  factory TrainingRequestConversationDynamic.fromJson(
          Map<String, dynamic> json) =>
      _$TrainingRequestConversationDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainingRequestConversationDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingRequestConversationId,
        conversationTypeDynamic,
        trainingRequestResponseDynamic,
        dateOfParticipation,
        deactivatedAt,
      ];



  @override
  String toString() {
    return 'TrainingRequestConversationDynamic(trainingRequestConversationId: $trainingRequestConversationId, conversationTypeDynamic: $conversationTypeDynamic, trainingRequestResponseDynamic: $trainingRequestResponseDynamic, dateOfParticipation: $dateOfParticipation, deactivatedAt: $deactivatedAt)';
  }
}
