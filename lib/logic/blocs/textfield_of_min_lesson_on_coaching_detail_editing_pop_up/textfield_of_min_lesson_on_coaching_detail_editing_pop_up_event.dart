part of 'textfield_of_min_lesson_on_coaching_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit
    extends TextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent {
  final int fieldText;

  const TextFieldOfMinLessonOnCoachingDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfMinLessonOnCoachingDetailEditingPopUpCompleted
    extends TextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent {
  final int fieldText;

  const TextFieldOfMinLessonOnCoachingDetailEditingPopUpCompleted(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfMinLessonOnCoachingDetailEditingPopUpClear
    extends TextFieldOfMinLessonOnCoachingDetailEditingPopUpEvent {}
