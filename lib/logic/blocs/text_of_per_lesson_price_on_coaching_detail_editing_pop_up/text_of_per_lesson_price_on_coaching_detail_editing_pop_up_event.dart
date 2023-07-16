part of 'text_of_per_lesson_price_on_coaching_detail_editing_pop_up_bloc.dart';

abstract class TextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent
    extends Equatable {
  const TextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit
    extends TextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfPerLessonPriceOnCoachingDetailEditingPopUpClear
    extends TextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent {}
