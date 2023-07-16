part of 'text_of_username_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfUsernameOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfUsernameOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfUsernameOnPersonalDetailEditingPopUpSubmit
    extends TextOfUsernameOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfUsernameOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfUsernameOnPersonalDetailEditingPopUpClear
    extends TextOfUsernameOnPersonalDetailEditingPopUpEvent {}
