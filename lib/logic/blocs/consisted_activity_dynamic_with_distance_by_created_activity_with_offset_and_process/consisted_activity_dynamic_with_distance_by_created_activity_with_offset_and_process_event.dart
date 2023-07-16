part of 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_and_process_bloc.dart';

abstract class ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessEvent
    extends Equatable {
  const ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessEvent();

  @override
  List<Object> get props => [];
}

class LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess
    extends ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessEvent {
  final int createdActivityId;
  final int offset;

  const LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess({
    required this.createdActivityId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [createdActivityId, offset];
}

class CleanConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess
    extends ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessEvent {}