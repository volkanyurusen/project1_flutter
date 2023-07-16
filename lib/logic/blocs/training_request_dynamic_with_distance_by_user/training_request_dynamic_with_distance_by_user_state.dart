part of 'training_request_dynamic_with_distance_by_user_bloc.dart';

class TrainingRequestDynamicWithDistanceByUserState extends Equatable {
  final List<TrainingRequestDynamicWithDistance>
      trainingRequestDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingRequestDynamicWithDistanceByUserState({
    this.trainingRequestDynamicWithDistanceList = const <TrainingRequestDynamicWithDistance>[],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingRequestDynamicWithDistanceByUserState copyWith({
    List<TrainingRequestDynamicWithDistance>?
        trainingRequestDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingRequestDynamicWithDistanceByUserState(
      trainingRequestDynamicWithDistanceList:
          trainingRequestDynamicWithDistanceList ??
              this.trainingRequestDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingRequestDynamicWithDistanceList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingRequestDynamicWithDistanceByUserState(trainingRequestDynamicWithDistanceList: $trainingRequestDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
