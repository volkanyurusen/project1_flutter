part of 'consisted_activity_dynamic_with_distance_attended_by_user_bloc.dart';

abstract class ConsistedActivityDynamicWithDistanceAttendedByUserEvent
    extends Equatable {
  const ConsistedActivityDynamicWithDistanceAttendedByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent
    extends ConsistedActivityDynamicWithDistanceAttendedByUserEvent {
  final int uId;
  final int offset;

  const LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallConsistedActivityDynamicWithDistanceAttendedByUserEvent
    extends ConsistedActivityDynamicWithDistanceAttendedByUserEvent {}
