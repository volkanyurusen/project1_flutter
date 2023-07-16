part of 'created_activity_dynamic_with_distance_created_by_user_bloc.dart';

abstract class CreatedActivityDynamicWithDistanceCreatedByUserEvent
    extends Equatable {
  const CreatedActivityDynamicWithDistanceCreatedByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent
    extends CreatedActivityDynamicWithDistanceCreatedByUserEvent {
  final int uId;
  final int offset;

  const LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallCreatedActivityDynamicWithDistanceCreatedByUserEvent
    extends CreatedActivityDynamicWithDistanceCreatedByUserEvent {}
