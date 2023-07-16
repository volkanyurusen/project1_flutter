part of 'consisted_activity_dynamic_with_distance_by_user_bloc.dart';

abstract class ConsistedActivityDynamicWithDistanceByUserEvent
    extends Equatable {
  const ConsistedActivityDynamicWithDistanceByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadConsistedActivityDynamicWithDistanceByUserEvent
    extends ConsistedActivityDynamicWithDistanceByUserEvent {
  final int uId;

  const LoadConsistedActivityDynamicWithDistanceByUserEvent({
    required this.uId,
  });

  @override
  List<Object> get props => [uId];
}
