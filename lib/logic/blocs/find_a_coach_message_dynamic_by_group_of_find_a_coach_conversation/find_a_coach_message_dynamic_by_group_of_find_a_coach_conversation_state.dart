part of 'find_a_coach_message_dynamic_by_group_of_find_a_coach_conversation_bloc.dart';

class FindACoachMessageDynamicByGroupOfFindACoachConversationState
    extends Equatable {
  final List<TrainingOfferMessageDynamic> trainingOfferMessageDynamicList;
  final String error;
  final Status status;

  const FindACoachMessageDynamicByGroupOfFindACoachConversationState({
    this.trainingOfferMessageDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  FindACoachMessageDynamicByGroupOfFindACoachConversationState copyWith({
    List<TrainingOfferMessageDynamic>? trainingOfferMessageDynamicList,
    String? error,
    Status? status,
  }) {
    return FindACoachMessageDynamicByGroupOfFindACoachConversationState(
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
      'FindACoachMessageDynamicByGroupOfFindACoachConversationState(tTrainingOfferMessageDynamicList: $trainingOfferMessageDynamicList, error: $error, status: $status)';
}
