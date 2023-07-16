part of 'text_of_name_surname_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfNameSurnameOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfNameSurnameOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit
    extends TextOfNameSurnameOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfNameSurnameOnPersonalDetailEditingPopUpClear
    extends TextOfNameSurnameOnPersonalDetailEditingPopUpEvent {}
