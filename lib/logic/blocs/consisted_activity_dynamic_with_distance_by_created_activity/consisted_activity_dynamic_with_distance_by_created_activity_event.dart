part of 'consisted_activity_dynamic_with_distance_by_created_activity_bloc.dart';

abstract class ConsistedActivityDynamicWithDistanceByCreatedActivityEvent
    extends Equatable {
  const ConsistedActivityDynamicWithDistanceByCreatedActivityEvent();

  @override
  List<Object> get props => [];
}

class LoadConsistedActivityDynamicWithDistanceByCreatedActivityEvent
    extends ConsistedActivityDynamicWithDistanceByCreatedActivityEvent {
  final int createdActivityId;

  const LoadConsistedActivityDynamicWithDistanceByCreatedActivityEvent({
    required this.createdActivityId,
  });

  @override
  List<Object> get props => [createdActivityId];
}
