part of 'text_of_experience_year_on_coaching_detail_editing_pop_up_bloc.dart';

abstract class TextOfExperienceYearOnCoachingDetailEditingPopUpEvent
    extends Equatable {
  const TextOfExperienceYearOnCoachingDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit
    extends TextOfExperienceYearOnCoachingDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfExperienceYearOnCoachingDetailEditingPopUpClear
    extends TextOfExperienceYearOnCoachingDetailEditingPopUpEvent {}
