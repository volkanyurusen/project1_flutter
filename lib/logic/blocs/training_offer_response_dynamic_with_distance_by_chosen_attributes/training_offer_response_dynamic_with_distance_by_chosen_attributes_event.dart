part of 'training_offer_response_dynamic_with_distance_by_chosen_attributes_bloc.dart';

abstract class TrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent
    extends Equatable {
  const TrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent
    extends TrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent {
  final String activityTitle;
  final int userId;

  const LoadTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent({
    required this.activityTitle,
    required this.userId,
  });

  @override
  List<Object> get props => [activityTitle, userId];
}

class RecallTrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent
    extends TrainingOfferResponseDynamicWithDistanceByChosenAttributesEvent {}