part of 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_bloc.dart';

abstract class ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetEvent
    extends Equatable {
  const ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetEvent();

  @override
  List<Object> get props => [];
}

class LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset
    extends ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetEvent {
  final int createdActivityId;
  final int offset;

  const LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset({
    required this.createdActivityId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [createdActivityId, offset];
}

class CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset
    extends ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetEvent {}