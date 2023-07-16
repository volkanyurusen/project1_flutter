part of 'coaching_type_bloc.dart';

abstract class CoachingTypeEvent extends Equatable {
  const CoachingTypeEvent();

  @override
  List<Object> get props => [];
}

class LoadCoachingTypeEvent extends CoachingTypeEvent {}
