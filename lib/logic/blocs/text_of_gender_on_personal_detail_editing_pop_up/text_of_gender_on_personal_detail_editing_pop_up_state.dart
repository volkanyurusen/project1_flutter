part of 'text_of_gender_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfGenderOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfGenderOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfGenderOnPersonalDetailEditingPopUpState extends Equatable {
  final String? gender;

  const TextOfGenderOnPersonalDetailEditingPopUpState({this.gender = ''});

  TextOfGenderOnPersonalDetailEditingPopUpState copyWith({String? gender}) {
    return TextOfGenderOnPersonalDetailEditingPopUpState(
        gender: gender ?? this.gender);
  }

  @override
  List<Object?> get props => [gender!];

  @override
  String toString() =>
      'TextOfGenderOnPersonalDetailEditingPopUpState(gender: $gender)';
}
