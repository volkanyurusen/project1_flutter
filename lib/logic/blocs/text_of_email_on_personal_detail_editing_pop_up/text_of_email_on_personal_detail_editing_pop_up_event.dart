part of 'text_of_email_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfEmailOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfEmailOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfEmailOnPersonalDetailEditingPopUpSubmit
    extends TextOfEmailOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfEmailOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfEmailOnPersonalDetailEditingPopUpClear
    extends TextOfEmailOnPersonalDetailEditingPopUpEvent {}
