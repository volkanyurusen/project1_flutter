part of 'training_request_response_dynamic_with_distance_by_training_request_bloc.dart';

class TrainingRequestResponseDynamicWithDistanceByTrainingRequestState
    extends Equatable {
  final List<TrainingRequestResponseDynamicWithDistance>
      trainingRequestResponseDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingRequestResponseDynamicWithDistanceByTrainingRequestState({
    this.trainingRequestResponseDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingRequestResponseDynamicWithDistanceByTrainingRequestState copyWith({
    List<TrainingRequestResponseDynamicWithDistance>?
        trainingRequestResponseDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingRequestResponseDynamicWithDistanceByTrainingRequestState(
      trainingRequestResponseDynamicWithDistanceList:
          trainingRequestResponseDynamicWithDistanceList ??
              this.trainingRequestResponseDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        trainingRequestResponseDynamicWithDistanceList,
        error,
        status,
        hasReachedMax
      ];

  @override
  String toString() =>
      'TrainingRequestResponseDynamicWithDistanceByTrainingRequestState(trainingRequestResponseDynamicWithDistanceList: $trainingRequestResponseDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
