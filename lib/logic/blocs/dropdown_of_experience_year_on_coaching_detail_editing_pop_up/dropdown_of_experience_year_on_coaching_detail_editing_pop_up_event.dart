part of 'dropdown_of_experience_year_on_coaching_detail_editing_pop_up_bloc.dart';

abstract class DropdownOfExperienceYearOnCoachingDetailEditingPopUpEvent
    extends Equatable {
  const DropdownOfExperienceYearOnCoachingDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit
    extends DropdownOfExperienceYearOnCoachingDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfExperienceYearOnCoachingDetailEditingPopUpCompleted
    extends DropdownOfExperienceYearOnCoachingDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfExperienceYearOnCoachingDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfExperienceYearOnCoachingDetailEditingPopUpClear
    extends DropdownOfExperienceYearOnCoachingDetailEditingPopUpEvent {}
