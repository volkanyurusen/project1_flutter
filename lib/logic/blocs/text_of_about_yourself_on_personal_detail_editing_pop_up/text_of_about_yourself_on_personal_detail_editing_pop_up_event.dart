part of 'text_of_about_yourself_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfAboutYourselfOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfAboutYourselfOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfAboutYourselfOnPersonalDetailEditingPopUpSubmit
    extends TextOfAboutYourselfOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfAboutYourselfOnPersonalDetailEditingPopUpClear
    extends TextOfAboutYourselfOnPersonalDetailEditingPopUpEvent {}
