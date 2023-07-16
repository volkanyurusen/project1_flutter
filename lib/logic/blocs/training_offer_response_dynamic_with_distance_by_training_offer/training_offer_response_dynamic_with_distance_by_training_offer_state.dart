part of 'training_offer_response_dynamic_with_distance_by_training_offer_bloc.dart';

class TrainingOfferResponseDynamicWithDistanceByTrainingOfferState
    extends Equatable {
  final List<TrainingOfferResponseDynamicWithDistance>
      trainingOfferResponseDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferResponseDynamicWithDistanceByTrainingOfferState({
    this.trainingOfferResponseDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferResponseDynamicWithDistanceByTrainingOfferState copyWith({
    List<TrainingOfferResponseDynamicWithDistance>?
        trainingOfferResponseDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferResponseDynamicWithDistanceByTrainingOfferState(
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
      'TrainingOfferResponseDynamicWithDistanceByTrainingOfferState(trainingOfferResponseDynamicWithDistanceList: $trainingOfferResponseDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
