part of 'training_offer_dynamic_with_distance_by_user_bloc.dart';

abstract class TrainingOfferDynamicWithDistanceByUserEvent extends Equatable {
  const TrainingOfferDynamicWithDistanceByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferDynamicWithDistanceByUserEvent
    extends TrainingOfferDynamicWithDistanceByUserEvent {
  final int userId;
  final String activityTitle;
  final int offset;

  const LoadTrainingOfferDynamicWithDistanceByUserEvent({
    required this.userId,
    required this.activityTitle,
    this.offset = 0,
  });

  @override
  List<Object> get props => [userId, activityTitle, offset];
}

class CleanTrainingOfferDynamicWithDistanceByUser
    extends TrainingOfferDynamicWithDistanceByUserEvent {}
