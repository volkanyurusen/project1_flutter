part of 'training_request_response_dynamic_by_chosen_attributes_bloc.dart';

class TrainingRequestResponseDynamicByChosenAttributesState extends Equatable {
  final List<TrainingRequestResponseDynamic> trainingRequestResponseDynamicList;
  final String error;
  final Status status;

  const TrainingRequestResponseDynamicByChosenAttributesState({
    this.trainingRequestResponseDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestResponseDynamicByChosenAttributesState copyWith({
    List<TrainingRequestResponseDynamic>? trainingRequestResponseDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestResponseDynamicByChosenAttributesState(
      trainingRequestResponseDynamicList: trainingRequestResponseDynamicList ??
          this.trainingRequestResponseDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestResponseDynamicList, error, status];

  @override
  String toString() =>
      'TrainingRequestResponseDynamicByChosenAttributesState(trainingRequestResponseDynamicList: $trainingRequestResponseDynamicList, error: $error, status: $status)';
}
