part of 'dropdown_of_gender_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class DropdownOfGenderOnPersonalDetailEditingPopUpState extends Equatable {
//   const DropdownOfGenderOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class DropdownOfGenderOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;

  const DropdownOfGenderOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
  });

  DropdownOfGenderOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText}) {
    return DropdownOfGenderOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
    );
  }

  @override
  List<Object?> get props => [fieldText!];

  @override
  String toString() =>
      'DropdownOfGenderOnPersonalDetailEditingPopUpState(fieldText: $fieldText}) ';
}
