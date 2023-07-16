part of 'training_offer_message_dynamic_by_group_of_training_offer_conversation_bloc.dart';

abstract class TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent
    extends Equatable {
  const TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent
    extends TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent {
  final int uId;
  final List<int?> trainingOfferConversationList;

  const LoadTrainingOfferMessageDynamicByGroupOfTrainingOfferConversationEvent({
    required this.uId,
    required this.trainingOfferConversationList,
  });

  @override
  List<Object> get props => [uId, trainingOfferConversationList];
}
