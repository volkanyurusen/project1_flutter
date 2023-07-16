part of 'training_request_conversation_dynamic_by_user_bloc.dart';

class TrainingRequestConversationDynamicByUserState extends Equatable {
  final List<TrainingRequestConversationDynamic>
      trainingRequestConversationDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingRequestConversationDynamicByUserState({
    this.trainingRequestConversationDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingRequestConversationDynamicByUserState copyWith({
    List<TrainingRequestConversationDynamic>?
        trainingRequestConversationDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingRequestConversationDynamicByUserState(
      trainingRequestConversationDynamicList:
          trainingRequestConversationDynamicList ??
              this.trainingRequestConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestConversationDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingRequestConversationDynamicByUserState(trainingRequestConversationDynamicList: $trainingRequestConversationDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
