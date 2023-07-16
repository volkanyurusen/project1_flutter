part of 'training_offer_dynamic_offered_by_coach_bloc.dart';

class TrainingOfferDynamicOfferedByCoachState extends Equatable {
  final List<TrainingOfferDynamic> trainingOfferDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const TrainingOfferDynamicOfferedByCoachState({
    this.trainingOfferDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  TrainingOfferDynamicOfferedByCoachState copyWith({
    List<TrainingOfferDynamic>? trainingOfferDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return TrainingOfferDynamicOfferedByCoachState(
      trainingOfferDynamicList:
          trainingOfferDynamicList ?? this.trainingOfferDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [trainingOfferDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'TrainingOfferDynamicOfferedByCoachState(trainingOfferDynamicList: $trainingOfferDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
