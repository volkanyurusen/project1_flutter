part of 'dropdown_of_country_on_personal_detail_editing_pop_up_bloc.dart';

abstract class DropdownOfCountryOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const DropdownOfCountryOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class DropdownOfCountryOnPersonalDetailEditingPopUpSubmit
    extends DropdownOfCountryOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfCountryOnPersonalDetailEditingPopUpCompleted
    extends DropdownOfCountryOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfCountryOnPersonalDetailEditingPopUpCompleted(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfCountryOnPersonalDetailEditingPopUpClear
    extends DropdownOfCountryOnPersonalDetailEditingPopUpEvent {}
