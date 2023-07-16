part of 'training_request_response_dynamic_with_distance_by_chosen_attributes_bloc.dart';

abstract class TrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent
    extends Equatable {
  const TrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent
    extends TrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent {
  final String activityTitle;
  final int coachUserId;

  const LoadTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent({
    required this.activityTitle,
    required this.coachUserId,
  });

  @override
  List<Object> get props => [activityTitle, coachUserId];
}

class RecallTrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent
    extends TrainingRequestResponseDynamicWithDistanceByChosenAttributesEvent {}
