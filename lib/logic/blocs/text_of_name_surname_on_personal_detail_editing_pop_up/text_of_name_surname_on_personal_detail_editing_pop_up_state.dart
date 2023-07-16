part of 'text_of_name_surname_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfNameSurnameOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfNameSurnameOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfNameSurnameOnPersonalDetailEditingPopUpState extends Equatable {
  final String? nameSurname;

  const TextOfNameSurnameOnPersonalDetailEditingPopUpState(
      {this.nameSurname = ''});

  TextOfNameSurnameOnPersonalDetailEditingPopUpState copyWith(
      {String? nameSurname}) {
    return TextOfNameSurnameOnPersonalDetailEditingPopUpState(
        nameSurname: nameSurname ?? this.nameSurname);
  }

  @override
  List<Object?> get props => [nameSurname!];

  @override
  String toString() =>
      'TextOfNameSurnameOnPersonalDetailEditingPopUpState(nameSurname: $nameSurname)';
}
