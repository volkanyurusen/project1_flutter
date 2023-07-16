part of 'textfield_of_address_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfAddressOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfAddressOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit
    extends TextFieldOfAddressOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfAddressOnPersonalDetailEditingPopUpCompleted
    extends TextFieldOfAddressOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfAddressOnPersonalDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfAddressOnPersonalDetailEditingPopUpClear
    extends TextFieldOfAddressOnPersonalDetailEditingPopUpEvent {}
