part of 'textfield_of_username_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfUsernameOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfUsernameOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit
    extends TextFieldOfUsernameOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfUsernameOnPersonalDetailEditingPopUpCompleted
    extends TextFieldOfUsernameOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfUsernameOnPersonalDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfUsernameOnPersonalDetailEditingPopUpClear
    extends TextFieldOfUsernameOnPersonalDetailEditingPopUpEvent {}
