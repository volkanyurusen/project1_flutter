part of 'textfield_of_birthyear_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit
    extends TextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent {
  final int fieldText;

  const TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfBirthyearOnPersonalDetailEditingPopUpCompleted
    extends TextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent {
  final int fieldText;

  const TextFieldOfBirthyearOnPersonalDetailEditingPopUpCompleted(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfBirthyearOnPersonalDetailEditingPopUpClear
    extends TextFieldOfBirthyearOnPersonalDetailEditingPopUpEvent {}
