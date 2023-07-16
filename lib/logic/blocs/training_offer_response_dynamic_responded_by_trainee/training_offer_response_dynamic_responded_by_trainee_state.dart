part of 'training_offer_response_dynamic_responded_by_trainee_bloc.dart';

class TrainingOfferResponseDynamicRespondedByTraineeState extends Equatable {
  final List<TrainingOfferResponseDynamic> trainingOfferResponseDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferResponseDynamicRespondedByTraineeState({
    this.trainingOfferResponseDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferResponseDynamicRespondedByTraineeState copyWith({
    List<TrainingOfferResponseDynamic>? trainingOfferResponseDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferResponseDynamicRespondedByTraineeState(
      trainingOfferResponseDynamicList:
          trainingOfferResponseDynamicList ?? this.trainingOfferResponseDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingOfferResponseDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingOfferResponseDynamicRespondedByTraineeState(trainingOfferResponseDynamicList: $trainingOfferResponseDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
