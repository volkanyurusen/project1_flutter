part of 'training_offer_response_dynamic_with_distance_by_chosen_attributes_bloc.dart';

class TrainingOfferResponseDynamicWithDistanceByChosenAttributesState
    extends Equatable {
  final List<TrainingOfferResponseDynamicWithDistance>
      trainingOfferResponseDynamicWithDistanceList;
  final String error;
  final Status status;

  const TrainingOfferResponseDynamicWithDistanceByChosenAttributesState({
    this.trainingOfferResponseDynamicWithDistanceList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferResponseDynamicWithDistanceByChosenAttributesState copyWith({
    List<TrainingOfferResponseDynamicWithDistance>?
        trainingOfferResponseDynamicWithDistanceList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferResponseDynamicWithDistanceByChosenAttributesState(
      trainingOfferResponseDynamicWithDistanceList:
          trainingOfferResponseDynamicWithDistanceList ??
              this.trainingOfferResponseDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [trainingOfferResponseDynamicWithDistanceList, error, status];

  @override
  String toString() =>
      'TrainingOfferResponseDynamicWithDistanceByChosenAttributesState(trainingOfferResponseDynamicWithDistanceList: $trainingOfferResponseDynamicWithDistanceList, error: $error, status: $status)';
}
