import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_per_lesson_price_on_coaching_detail_editing_pop_up_event.dart';
part 'text_of_per_lesson_price_on_coaching_detail_editing_pop_up_state.dart';

class TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc extends Bloc<
        TextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent,
        TextOfPerLessonPriceOnCoachingDetailEditingPopUpState>
    with PerLessonPriceValidationMixin {
  TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc()
      : super(TextOfPerLessonPriceOnCoachingDetailEditingPopUpState()) {
    on<TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit>(
        _onTextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent);
    on<TextOfPerLessonPriceOnCoachingDetailEditingPopUpClear>(
        _onTextOfPerLessonPriceOnCoachingDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfPerLessonPriceOnCoachingDetailEditingPopUpEvent(
      TextOfPerLessonPriceOnCoachingDetailEditingPopUpSubmit event,
      Emitter<TextOfPerLessonPriceOnCoachingDetailEditingPopUpState> emit) {
    //
    // print('perLessonPrice is: ${event.fieldText}');
    emit(state.copyWith(perLessonPrice: event.fieldText));
  }

  FutureOr<void> _onTextOfPerLessonPriceOnCoachingDetailEditingPopUpClear(
      TextOfPerLessonPriceOnCoachingDetailEditingPopUpClear event,
      Emitter<TextOfPerLessonPriceOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(perLessonPrice: ''));
    //
    //print('name is: $state');
  }
}
