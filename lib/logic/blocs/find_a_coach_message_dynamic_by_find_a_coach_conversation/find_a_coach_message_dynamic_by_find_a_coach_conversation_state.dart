part of 'find_a_coach_message_dynamic_by_find_a_coach_conversation_bloc.dart';

class FindACoachMessageDynamicByFindACoachConversationState
    extends Equatable {
  final List<TrainingOfferMessageDynamic> trainingOfferMessageDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const FindACoachMessageDynamicByFindACoachConversationState({
    this.trainingOfferMessageDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  FindACoachMessageDynamicByFindACoachConversationState copyWith({
    List<TrainingOfferMessageDynamic>? trainingOfferMessageDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return FindACoachMessageDynamicByFindACoachConversationState(
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
      'FindACoachMessageDynamicByFindACoachConversationState(tTrainingOfferMessageDynamicList: $trainingOfferMessageDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
