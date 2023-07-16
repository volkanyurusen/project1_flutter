part of 'training_offer_response_dynamic_with_distance_of_chosen_activity_by_trainee_bloc.dart';

class TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState
    extends Equatable {
  final List<TrainingOfferResponseDynamicWithDistance>
      trainingOfferResponseDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState({
    this.trainingOfferResponseDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState copyWith({
    List<TrainingOfferResponseDynamicWithDistance>?
        trainingOfferResponseDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState(
      trainingOfferResponseDynamicWithDistanceList:
          trainingOfferResponseDynamicWithDistanceList ??
              this.trainingOfferResponseDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        trainingOfferResponseDynamicWithDistanceList,
        error,
        status,
        hasReachedMax
      ];

  @override
  String toString() =>
      'TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeState(trainingOfferResponseDynamicWithDistanceList: $trainingOfferResponseDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
