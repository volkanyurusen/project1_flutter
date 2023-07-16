part of 'training_request_dynamic_by_chosen_attributes_bloc.dart';

class TrainingRequestDynamicByChosenAttributesState extends Equatable {
  final List<TrainingRequestDynamic> trainingRequestDynamicList;
  final String error;
  final Status status;

  const TrainingRequestDynamicByChosenAttributesState({
    this.trainingRequestDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestDynamicByChosenAttributesState copyWith({
    List<TrainingRequestDynamic>? trainingRequestDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestDynamicByChosenAttributesState(
      trainingRequestDynamicList:
          trainingRequestDynamicList ?? this.trainingRequestDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [trainingRequestDynamicList, error, status];

  @override
  String toString() =>
      'TrainingRequestDynamicByChosenAttributesState(trainingRequestDynamicList: $trainingRequestDynamicList, error: $error, status: $status)';
}
