part of 'training_offer_message_dynamic_by_training_offer_conversation_bloc.dart';

class TrainingOfferMessageDynamicByTrainingOfferConversationState
    extends Equatable {
  final List<TrainingOfferMessageDynamic> trainingOfferMessageDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferMessageDynamicByTrainingOfferConversationState({
    this.trainingOfferMessageDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferMessageDynamicByTrainingOfferConversationState copyWith({
    List<TrainingOfferMessageDynamic>? trainingOfferMessageDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferMessageDynamicByTrainingOfferConversationState(
      trainingOfferMessageDynamicList: trainingOfferMessageDynamicList ??
          this.trainingOfferMessageDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingOfferMessageDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingOfferMessageDynamicByTrainingOfferConversationState(tTrainingOfferMessageDynamicList: $trainingOfferMessageDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
