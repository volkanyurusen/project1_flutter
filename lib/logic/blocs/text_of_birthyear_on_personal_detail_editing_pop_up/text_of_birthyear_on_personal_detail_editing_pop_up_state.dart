part of 'text_of_birthyear_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfBirthyearOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfBirthyearOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfBirthyearOnPersonalDetailEditingPopUpState extends Equatable {
  final String? birthyear;

  const TextOfBirthyearOnPersonalDetailEditingPopUpState(
      {this.birthyear = ''});

  TextOfBirthyearOnPersonalDetailEditingPopUpState copyWith(
      {String? birthyear}) {
    return TextOfBirthyearOnPersonalDetailEditingPopUpState(
        birthyear: birthyear ?? this.birthyear);
  }

  @override
  List<Object?> get props => [birthyear!];

  @override
  String toString() =>
      'TextOfBirthyearOnPersonalDetailEditingPopUpState(birthyear: $birthyear)';
}
