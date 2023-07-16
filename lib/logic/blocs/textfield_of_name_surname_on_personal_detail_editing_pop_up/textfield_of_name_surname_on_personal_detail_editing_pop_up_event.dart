part of 'textfield_of_name_surname_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfNameSurnameOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfNameSurnameOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit
    extends TextFieldOfNameSurnameOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfNameSurnameOnPersonalDetailEditingPopUpCompleted
    extends TextFieldOfNameSurnameOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfNameSurnameOnPersonalDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfNameSurnameOnPersonalDetailEditingPopUpClear
    extends TextFieldOfNameSurnameOnPersonalDetailEditingPopUpEvent {}
