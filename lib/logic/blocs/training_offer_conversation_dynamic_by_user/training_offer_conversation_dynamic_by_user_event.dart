part of 'training_offer_conversation_dynamic_by_user_bloc.dart';

abstract class TrainingOfferConversationDynamicByUserEvent extends Equatable {
  const TrainingOfferConversationDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferConversationDynamicByUserEvent
    extends TrainingOfferConversationDynamicByUserEvent {
  final int uId;
  final int offset;

  const LoadTrainingOfferConversationDynamicByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}
