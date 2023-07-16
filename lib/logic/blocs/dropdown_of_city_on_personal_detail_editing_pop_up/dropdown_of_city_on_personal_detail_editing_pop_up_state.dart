part of 'dropdown_of_city_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class DropdownOfCityOnPersonalDetailEditingPopUpState extends Equatable {
//   const DropdownOfCityOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class DropdownOfCityOnPersonalDetailEditingPopUpState extends Equatable {
  final String? fieldText;

  const DropdownOfCityOnPersonalDetailEditingPopUpState({
    this.fieldText = '',
  });

  DropdownOfCityOnPersonalDetailEditingPopUpState copyWith(
      {String? fieldText}) {
    return DropdownOfCityOnPersonalDetailEditingPopUpState(
      fieldText: fieldText ?? this.fieldText,
    );
  }

  @override
  List<Object?> get props => [fieldText!];

  @override
  String toString() =>
      'DropdownOfCityOnPersonalDetailEditingPopUpState(fieldText: $fieldText}) ';
}
