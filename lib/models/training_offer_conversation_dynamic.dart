// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_project/models/models_dynamics.dart';

part 'training_offer_conversation_dynamic.g.dart';

const String tblTrainingOfferConversationDynamics =
    'tblTrainingOfferConversationDynamics';

class TrainingOfferConversationDynamicFields {
  static final List<String> values = [
    trainingOfferConversationId,
    conversationTypeId,
    trainingOfferResponseId,
    dateOfParticipation,
  ];
  static const String trainingOfferConversationId =
      'training_offer_conversation_id';
  static const String conversationTypeId = 'conversation_type_id';
  static const String trainingOfferResponseId = 'training_offer_response_id';
  static const String dateOfParticipation = 'date_of_participation';
}

@JsonSerializable()
class TrainingOfferConversationDynamic extends Equatable {
  final int? trainingOfferConversationId;
  final ConversationTypeDynamic conversationTypeDynamic;
  final TrainingOfferResponseDynamic trainingOfferResponseDynamic;
  final DateTime dateOfParticipation;

  TrainingOfferConversationDynamic({
    this.trainingOfferConversationId,
    required this.conversationTypeDynamic,
    required this.trainingOfferResponseDynamic,
    DateTime? dateOfParticipation,
  }) : dateOfParticipation = dateOfParticipation ?? DateTime.now();

  TrainingOfferConversationDynamic copy({
    int? trainingOfferConversationId,
    ConversationTypeDynamic? conversationTypeDynamic,
    TrainingOfferResponseDynamic? trainingOfferResponseDynamic,
    DateTime? dateOfParticipation,
  }) =>
      TrainingOfferConversationDynamic(
        trainingOfferConversationId:
            trainingOfferConversationId ?? this.trainingOfferConversationId,
        conversationTypeDynamic:
            conversationTypeDynamic ?? this.conversationTypeDynamic,
        trainingOfferResponseDynamic:
            trainingOfferResponseDynamic ?? this.trainingOfferResponseDynamic,
        dateOfParticipation: dateOfParticipation ?? this.dateOfParticipation,
      );

  factory TrainingOfferConversationDynamic.fromJson(
          Map<String, dynamic> json) =>
      _$TrainingOfferConversationDynamicFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TrainingOfferConversationDynamicToJson(this);

  @override
  List<Object?> get props => [
        trainingOfferConversationId,
        conversationTypeDynamic,
        trainingOfferResponseDynamic,
        dateOfParticipation,
      ];

  @override
  String toString() {
    return 'tblTrainingOfferConversations(training_offer_conversationId: $trainingOfferConversationId, conversation_type: $conversationTypeDynamic, training_offer_response: $trainingOfferResponseDynamic, created_at: $dateOfParticipation,)';
  }
}
