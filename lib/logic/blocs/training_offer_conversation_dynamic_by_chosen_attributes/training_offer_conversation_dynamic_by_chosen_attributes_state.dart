part of 'training_offer_conversation_dynamic_by_chosen_attributes_bloc.dart';

class TrainingOfferConversationDynamicByChosenAttributesState
    extends Equatable {
  final List<TrainingOfferConversationDynamic>
      trainingOfferConversationDynamicList;
  final String error;
  final Status status;

  const TrainingOfferConversationDynamicByChosenAttributesState({
    this.trainingOfferConversationDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferConversationDynamicByChosenAttributesState copyWith({
    List<TrainingOfferConversationDynamic>?
        trainingOfferConversationDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferConversationDynamicByChosenAttributesState(
      trainingOfferConversationDynamicList:
          trainingOfferConversationDynamicList ??
              this.trainingOfferConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [trainingOfferConversationDynamicList, error, status];

  @override
  String toString() =>
      'TrainingOfferConversationDynamicByChosenAttributesState(trainingOfferConversationDynamicList: $trainingOfferConversationDynamicList, error: $error, status: $status)';
}
