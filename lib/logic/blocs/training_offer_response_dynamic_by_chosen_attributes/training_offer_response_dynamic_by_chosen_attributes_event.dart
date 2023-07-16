part of 'training_offer_response_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingOfferResponseDynamicByChosenAttributesEvent extends Equatable {
  const TrainingOfferResponseDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferResponseDynamicByChosenAttributesEvent
    extends TrainingOfferResponseDynamicByChosenAttributesEvent {
  final int trainingOfferId;
  final int traineeId;

  const LoadTrainingOfferResponseDynamicByChosenAttributesEvent({
    required this.trainingOfferId,
    required this.traineeId,
  });

  @override
  List<Object> get props => [trainingOfferId, traineeId];
}
