part of 'training_request_conversation_dynamic_by_chosen_attributes_bloc.dart';

class TrainingRequestConversationDynamicByChosenAttributesState
    extends Equatable {
  final List<TrainingRequestConversationDynamic>
      trainingRequestConversationDynamicList;
  final String error;
  final Status status;

  const TrainingRequestConversationDynamicByChosenAttributesState({
    this.trainingRequestConversationDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestConversationDynamicByChosenAttributesState copyWith({
    List<TrainingRequestConversationDynamic>?
        trainingRequestConversationDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestConversationDynamicByChosenAttributesState(
      trainingRequestConversationDynamicList:
          trainingRequestConversationDynamicList ??
              this.trainingRequestConversationDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestConversationDynamicList, error, status];

  @override
  String toString() =>
      'TrainingRequestConversationDynamicByChosenAttributesState(trainingRequestConversationDynamicList: $trainingRequestConversationDynamicList, error: $error, status: $status)';
}
