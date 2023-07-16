part of 'dropdown_of_country_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class DropdownOfCountryOnPersonalDetailEditingPopUpState extends Equatable {
//   const DropdownOfCountryOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class DropdownOfCountryOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;

  const DropdownOfCountryOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
  });

  DropdownOfCountryOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText}) {
    return DropdownOfCountryOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
    );
  }

  @override
  List<Object?> get props => [fieldText!];

  @override
  String toString() =>
      'DropdownOfCountryOnPersonalDetailEditingPopUpState(fieldText: $fieldText}) ';
}
