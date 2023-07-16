part of 'text_of_experience_year_on_coaching_detail_editing_pop_up_bloc.dart';

// abstract class TextOfExperienceYearOnCoachingDetailEditingPopUpState extends Equatable {
//   const TextOfExperienceYearOnCoachingDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfExperienceYearOnCoachingDetailEditingPopUpState extends Equatable {
  final String? experienceYear;

  const TextOfExperienceYearOnCoachingDetailEditingPopUpState(
      {this.experienceYear = ''});

  TextOfExperienceYearOnCoachingDetailEditingPopUpState copyWith(
      {String? experienceYear}) {
    return TextOfExperienceYearOnCoachingDetailEditingPopUpState(
        experienceYear: experienceYear ?? this.experienceYear);
  }

  @override
  List<Object?> get props => [experienceYear!];

  @override
  String toString() =>
      'TextOfExperienceYearOnCoachingDetailEditingPopUpState(experienceYear: $experienceYear)';
}
