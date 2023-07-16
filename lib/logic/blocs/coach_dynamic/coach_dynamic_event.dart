part of 'coach_dynamic_bloc.dart';

abstract class CoachDynamicEvent extends Equatable {
  const CoachDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadCoachDynamicEvent extends CoachDynamicEvent {
  final int coachId;

  const LoadCoachDynamicEvent({
    required this.coachId,
  });

  @override
  List<Object> get props => [coachId];
}

class RecallCoachDynamicEvent extends CoachDynamicEvent {}
