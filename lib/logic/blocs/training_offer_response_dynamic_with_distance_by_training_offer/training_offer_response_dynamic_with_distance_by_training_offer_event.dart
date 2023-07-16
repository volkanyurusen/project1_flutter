part of 'training_offer_response_dynamic_with_distance_by_training_offer_bloc.dart';

abstract class TrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent
    extends Equatable {
  const TrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent
    extends TrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent {
  final int trainingOfferId;
  final int offset;

  const LoadTrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent({
    required this.trainingOfferId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [trainingOfferId, offset];
}

class CleanTrainingOfferResponseDynamicWithDistanceByTrainingOffer
    extends TrainingOfferResponseDynamicWithDistanceByTrainingOfferEvent {}
