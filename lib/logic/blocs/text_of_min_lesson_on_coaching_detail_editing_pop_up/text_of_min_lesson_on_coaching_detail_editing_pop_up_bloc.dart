import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_min_lesson_on_coaching_detail_editing_pop_up_event.dart';
part 'text_of_min_lesson_on_coaching_detail_editing_pop_up_state.dart';

class TextOfMinLessonOnCoachingDetailEditingPopUpBloc extends Bloc<
        TextOfMinLessonOnCoachingDetailEditingPopUpEvent,
        TextOfMinLessonOnCoachingDetailEditingPopUpState>
    with MinLessonValidationMixin {
  TextOfMinLessonOnCoachingDetailEditingPopUpBloc()
      : super(TextOfMinLessonOnCoachingDetailEditingPopUpState()) {
    on<TextOfMinLessonOnCoachingDetailEditingPopUpSubmit>(
        _onTextOfMinLessonOnCoachingDetailEditingPopUpEvent);
    on<TextOfMinLessonOnCoachingDetailEditingPopUpClear>(
        _onTextOfMinLessonOnCoachingDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfMinLessonOnCoachingDetailEditingPopUpEvent(
      TextOfMinLessonOnCoachingDetailEditingPopUpSubmit event,
      Emitter<TextOfMinLessonOnCoachingDetailEditingPopUpState> emit) {
    //
    // print('birthyear is: ${event.fieldText}');
    emit(state.copyWith(minLesson: event.fieldText));
  }

  FutureOr<void> _onTextOfMinLessonOnCoachingDetailEditingPopUpClear(
      TextOfMinLessonOnCoachingDetailEditingPopUpClear event,
      Emitter<TextOfMinLessonOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(minLesson: ''));
    //
    //print('name is: $state');
  }
}
