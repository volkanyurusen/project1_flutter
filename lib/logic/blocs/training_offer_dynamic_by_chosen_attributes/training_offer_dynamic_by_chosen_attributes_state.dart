part of 'training_offer_dynamic_by_chosen_attributes_bloc.dart';

class TrainingOfferDynamicByChosenAttributesState extends Equatable {
  final List<TrainingOfferDynamic> trainingOfferDynamicList;
  final String error;
  final Status status;

  const TrainingOfferDynamicByChosenAttributesState({
    this.trainingOfferDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingOfferDynamicByChosenAttributesState copyWith({
    List<TrainingOfferDynamic>? trainingOfferDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingOfferDynamicByChosenAttributesState(
      trainingOfferDynamicList:
          trainingOfferDynamicList ?? this.trainingOfferDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [trainingOfferDynamicList, error, status];

  @override
  String toString() =>
      'TrainingOfferDynamicByChosenAttributesState(trainingOfferDynamicList: $trainingOfferDynamicList, error: $error, status: $status)';
}
