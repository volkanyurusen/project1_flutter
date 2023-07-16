part of 'training_offer_dynamic_with_distance_by_user_bloc.dart';

class TrainingOfferDynamicWithDistanceByUserState extends Equatable {
  final List<TrainingOfferDynamicWithDistance>
      trainingOfferDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferDynamicWithDistanceByUserState({
    this.trainingOfferDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferDynamicWithDistanceByUserState copyWith({
    List<TrainingOfferDynamicWithDistance>?
        trainingOfferDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferDynamicWithDistanceByUserState(
      trainingOfferDynamicWithDistanceList:
          trainingOfferDynamicWithDistanceList ??
              this.trainingOfferDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingOfferDynamicWithDistanceList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingOfferDynamicWithDistanceByUserState(trainingOfferDynamicWithDistanceList: $trainingOfferDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
