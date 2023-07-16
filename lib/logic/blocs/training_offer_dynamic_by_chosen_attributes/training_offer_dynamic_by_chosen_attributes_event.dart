part of 'training_offer_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingOfferDynamicByChosenAttributesEvent extends Equatable {
  const TrainingOfferDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferDynamicByChosenAttributesEvent
    extends TrainingOfferDynamicByChosenAttributesEvent {
  final int coachId;
  final int trainingDetailId;
  final int coachingLocationDetailId;

  const LoadTrainingOfferDynamicByChosenAttributesEvent({
    required this.coachId,
    required this.trainingDetailId,
    required this.coachingLocationDetailId,
  });

  @override
  List<Object> get props =>
      [coachId, trainingDetailId, coachingLocationDetailId];
}
