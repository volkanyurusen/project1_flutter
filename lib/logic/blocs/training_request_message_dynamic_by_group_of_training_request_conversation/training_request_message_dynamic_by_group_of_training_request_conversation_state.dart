part of 'training_request_message_dynamic_by_group_of_training_request_conversation_bloc.dart';

class TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState extends Equatable {
  final List<TrainingRequestMessageDynamic>
      trainingRequestMessageDynamicList;
  final String error;
  final Status status;

  const TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState({
    this.trainingRequestMessageDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState copyWith({
    List<TrainingRequestMessageDynamic>?
        trainingRequestMessageDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState(
      trainingRequestMessageDynamicList:
          trainingRequestMessageDynamicList ??
              this.trainingRequestMessageDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestMessageDynamicList, error, status];

  @override
  String toString() =>
      'TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationState(tTrainingRequestMessageDynamicList: $trainingRequestMessageDynamicList, error: $error, status: $status)';
}
