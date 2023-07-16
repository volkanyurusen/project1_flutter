part of 'textfield_of_email_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfEmailOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfEmailOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit
    extends TextFieldOfEmailOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfEmailOnPersonalDetailEditingPopUpCompleted
    extends TextFieldOfEmailOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfEmailOnPersonalDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfEmailOnPersonalDetailEditingPopUpClear
    extends TextFieldOfEmailOnPersonalDetailEditingPopUpEvent {}
