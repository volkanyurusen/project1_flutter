part of 'training_request_dynamic_with_distance_by_user_bloc.dart';

abstract class TrainingRequestDynamicWithDistanceByUserEvent extends Equatable {
  const TrainingRequestDynamicWithDistanceByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestDynamicWithDistanceByUserEvent
    extends TrainingRequestDynamicWithDistanceByUserEvent {
  final int userId;
  final String activityTitle;
  final int offset;

  const LoadTrainingRequestDynamicWithDistanceByUserEvent({
    required this.userId,
    required this.activityTitle,
    this.offset = 0,
  });

  @override
  List<Object> get props => [userId, activityTitle, offset];
}

class CleanTrainingRequestDynamicWithDistanceByUser
    extends TrainingRequestDynamicWithDistanceByUserEvent {}
