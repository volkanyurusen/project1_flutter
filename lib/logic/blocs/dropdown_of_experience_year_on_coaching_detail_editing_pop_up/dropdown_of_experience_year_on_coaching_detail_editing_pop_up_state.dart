part of 'dropdown_of_experience_year_on_coaching_detail_editing_pop_up_bloc.dart';

// abstract class DropdownOfExperienceYearOnCoachingDetailEditingPopUpState extends Equatable {
//   const DropdownOfExperienceYearOnCoachingDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class DropdownOfExperienceYearOnCoachingDetailEditingPopUpState extends Equatable {
  final String? fieldText;

  const DropdownOfExperienceYearOnCoachingDetailEditingPopUpState({
    this.fieldText = '',
  });

  DropdownOfExperienceYearOnCoachingDetailEditingPopUpState copyWith(
      {String? fieldText}) {
    return DropdownOfExperienceYearOnCoachingDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
    );
  }

  @override
  List<Object?> get props => [fieldText!];

  @override
  String toString() =>
      'DropdownOfExperienceYearOnCoachingDetailEditingPopUpState(fieldText: $fieldText}) ';
}
