part of 'training_request_response_dynamic_with_distance_by_chosen_attributes_bloc.dart';

class TrainingRequestResponseDynamicWithDistanceByChosenAttributesState
    extends Equatable {
  final List<TrainingRequestResponseDynamicWithDistance>
      trainingRequestResponseDynamicWithDistanceList;
  final String error;
  final Status status;

  const TrainingRequestResponseDynamicWithDistanceByChosenAttributesState({
    this.trainingRequestResponseDynamicWithDistanceList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingRequestResponseDynamicWithDistanceByChosenAttributesState copyWith({
    List<TrainingRequestResponseDynamicWithDistance>?
        trainingRequestResponseDynamicWithDistanceList,
    String? error,
    Status? status,
  }) {
    return TrainingRequestResponseDynamicWithDistanceByChosenAttributesState(
      trainingRequestResponseDynamicWithDistanceList:
          trainingRequestResponseDynamicWithDistanceList ??
              this.trainingRequestResponseDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [trainingRequestResponseDynamicWithDistanceList, error, status];

  @override
  String toString() =>
      'TrainingRequestResponseDynamicWithDistanceByChosenAttributesState(trainingRequestResponseDynamicWithDistanceList: $trainingRequestResponseDynamicWithDistanceList, error: $error, status: $status)';
}
