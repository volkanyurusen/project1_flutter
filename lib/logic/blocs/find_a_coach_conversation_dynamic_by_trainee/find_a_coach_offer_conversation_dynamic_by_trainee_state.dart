part of 'find_a_coach_offer_conversation_dynamic_by_trainee_bloc.dart';

class FindACoachConversationDynamicByTraineeState extends Equatable {
  final List<TrainingOfferConversationDynamic>
      findACoachConversationDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const FindACoachConversationDynamicByTraineeState({
    this.findACoachConversationDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  FindACoachConversationDynamicByTraineeState copyWith({
    List<TrainingOfferConversationDynamic>? findACoachConversationDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return FindACoachConversationDynamicByTraineeState(
      findACoachConversationDynamicList: findACoachConversationDynamicList ??
          this.findACoachConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [findACoachConversationDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'FindACoachConversationDynamicByTraineeState(findACoachConversationDynamicList: $findACoachConversationDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
