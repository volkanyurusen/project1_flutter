part of 'text_of_min_lesson_on_coaching_detail_editing_pop_up_bloc.dart';

abstract class TextOfMinLessonOnCoachingDetailEditingPopUpEvent
    extends Equatable {
  const TextOfMinLessonOnCoachingDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfMinLessonOnCoachingDetailEditingPopUpSubmit
    extends TextOfMinLessonOnCoachingDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfMinLessonOnCoachingDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfMinLessonOnCoachingDetailEditingPopUpClear
    extends TextOfMinLessonOnCoachingDetailEditingPopUpEvent {}
