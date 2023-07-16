part of 'training_offer_message_dynamic_by_group_of_training_offer_conversation_bloc.dart';

class TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState
    extends Equatable {
  final List<TrainingOfferMessageDynamic> trainingOfferMessageDynamicList;
  final String error;
  final Status status;

  const TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState({
    this.trainingOfferMessageDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState copyWith({
    List<TrainingOfferMessageDynamic>? trainingOfferMessageDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState(
      trainingOfferMessageDynamicList: trainingOfferMessageDynamicList ??
          this.trainingOfferMessageDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [trainingOfferMessageDynamicList, error, status];

  @override
  String toString() =>
      'TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationState(tTrainingOfferMessageDynamicList: $trainingOfferMessageDynamicList, error: $error, status: $status)';
}
