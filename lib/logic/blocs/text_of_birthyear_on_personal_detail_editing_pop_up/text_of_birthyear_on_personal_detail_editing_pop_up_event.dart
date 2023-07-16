part of 'text_of_birthyear_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfBirthyearOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfBirthyearOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfBirthyearOnPersonalDetailEditingPopUpSubmit
    extends TextOfBirthyearOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfBirthyearOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfBirthyearOnPersonalDetailEditingPopUpClear
    extends TextOfBirthyearOnPersonalDetailEditingPopUpEvent {}
