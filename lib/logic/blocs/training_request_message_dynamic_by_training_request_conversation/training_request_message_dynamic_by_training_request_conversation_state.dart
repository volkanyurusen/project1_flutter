part of 'training_request_message_dynamic_by_training_request_conversation_bloc.dart';

class TrainingRequestMessageDynamicByTrainingRequestConversationState
    extends Equatable {
  final List<TrainingRequestMessageDynamic> trainingRequestMessageDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingRequestMessageDynamicByTrainingRequestConversationState({
    this.trainingRequestMessageDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingRequestMessageDynamicByTrainingRequestConversationState copyWith({
    List<TrainingRequestMessageDynamic>? trainingRequestMessageDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingRequestMessageDynamicByTrainingRequestConversationState(
      trainingRequestMessageDynamicList: trainingRequestMessageDynamicList ??
          this.trainingRequestMessageDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestMessageDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingRequestMessageDynamicByTrainingRequestConversationState(tTrainingRequestMessageDynamicList: $trainingRequestMessageDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
