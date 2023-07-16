part of 'dropdown_of_city_on_personal_detail_editing_pop_up_bloc.dart';

abstract class DropdownOfCityOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const DropdownOfCityOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class DropdownOfCityOnPersonalDetailEditingPopUpSubmit
    extends DropdownOfCityOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfCityOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfCityOnPersonalDetailEditingPopUpCompleted
    extends DropdownOfCityOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfCityOnPersonalDetailEditingPopUpCompleted(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfCityOnPersonalDetailEditingPopUpClear
    extends DropdownOfCityOnPersonalDetailEditingPopUpEvent {}
