part of 'coaching_experience_dynamic_by_chosen_attributes_bloc.dart';

abstract class CoachingExperienceDynamicByChosenAttributesEvent
    extends Equatable {
  const CoachingExperienceDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadCoachingExperienceDynamicByChosenAttributesEvent
    extends CoachingExperienceDynamicByChosenAttributesEvent {
  final int coachingExperienceYearId;

  const LoadCoachingExperienceDynamicByChosenAttributesEvent({
    required this.coachingExperienceYearId,
  });

  @override
  List<Object> get props => [coachingExperienceYearId];
}
