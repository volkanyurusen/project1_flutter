part of 'textfield_of_per_lesson_price_on_coaching_detail_editing_pop_up_bloc.dart';

abstract class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent
    extends Equatable {
  const TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit
    extends TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent {
  final int fieldText;

  const TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpCompleted
    extends TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent {
  final int fieldText;

  const TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpCompleted(
      this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpClear
    extends TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpEvent {}
