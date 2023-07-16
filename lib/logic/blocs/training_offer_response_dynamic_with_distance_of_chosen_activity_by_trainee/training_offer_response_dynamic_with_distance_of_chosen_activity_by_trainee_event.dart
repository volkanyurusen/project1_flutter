part of 'training_offer_response_dynamic_with_distance_of_chosen_activity_by_trainee_bloc.dart';

abstract class TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent
    extends Equatable {
  const TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent
    extends TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent {
  final int traineeId;
  final int activityNameId;
  final int offset;

  const LoadTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent({
    required this.traineeId,
    required this.activityNameId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [traineeId, activityNameId, offset];
}

class CleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee
    extends TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEvent {}
