part of 'dropdown_of_gender_on_personal_detail_editing_pop_up_bloc.dart';

abstract class DropdownOfGenderOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const DropdownOfGenderOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class DropdownOfGenderOnPersonalDetailEditingPopUpSubmit
    extends DropdownOfGenderOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfGenderOnPersonalDetailEditingPopUpCompleted
    extends DropdownOfGenderOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const DropdownOfGenderOnPersonalDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class DropdownOfGenderOnPersonalDetailEditingPopUpClear
    extends DropdownOfGenderOnPersonalDetailEditingPopUpEvent {}
