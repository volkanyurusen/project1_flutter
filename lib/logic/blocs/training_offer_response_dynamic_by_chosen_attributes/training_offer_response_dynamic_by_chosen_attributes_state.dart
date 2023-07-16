part of 'training_offer_response_dynamic_by_chosen_attributes_bloc.dart';

class TrainingOfferResponseDynamicByChosenAttributesState extends Equatable {
  final List<TrainingOfferResponseDynamic> trainingOfferResponseDynamicList;
  final String error;
  final Status status;

  const TrainingOfferResponseDynamicByChosenAttributesState({
    this.trainingOfferResponseDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferResponseDynamicByChosenAttributesState copyWith({
    List<TrainingOfferResponseDynamic>? trainingOfferResponseDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferResponseDynamicByChosenAttributesState(
      trainingOfferResponseDynamicList: trainingOfferResponseDynamicList ??
          this.trainingOfferResponseDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [trainingOfferResponseDynamicList, error, status];

  @override
  String toString() =>
      'TrainingOfferResponseDynamicByChosenAttributesState(trainingOfferResponseDynamicList: $trainingOfferResponseDynamicList, error: $error, status: $status)';
}
