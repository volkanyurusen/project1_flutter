part of 'coach_bloc.dart';

abstract class CoachEvent extends Equatable {
  const CoachEvent();

  @override
  List<Object> get props => [];
}

class LoadCoachEvent extends CoachEvent {
  final int coachId;

  const LoadCoachEvent({
    required this.coachId,
  });

  @override
  List<Object> get props => [coachId];
}

class RecallCoachEvent extends CoachEvent {}
