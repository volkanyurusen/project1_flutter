part of 'textfield_of_about_yourself_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit
    extends TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpCompleted
    extends TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpClear
    extends TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpEvent {}
