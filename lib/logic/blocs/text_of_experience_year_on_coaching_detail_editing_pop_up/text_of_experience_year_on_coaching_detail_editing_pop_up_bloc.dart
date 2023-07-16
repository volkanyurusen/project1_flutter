import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'text_of_experience_year_on_coaching_detail_editing_pop_up_event.dart';
part 'text_of_experience_year_on_coaching_detail_editing_pop_up_state.dart';

class TextOfExperienceYearOnCoachingDetailEditingPopUpBloc extends Bloc<
    TextOfExperienceYearOnCoachingDetailEditingPopUpEvent,
    TextOfExperienceYearOnCoachingDetailEditingPopUpState> {
  TextOfExperienceYearOnCoachingDetailEditingPopUpBloc()
      : super(TextOfExperienceYearOnCoachingDetailEditingPopUpState()) {
    on<TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit>(
        _onTextOfExperienceYearOnCoachingDetailEditingPopUpEvent);
    on<TextOfExperienceYearOnCoachingDetailEditingPopUpClear>(
        _onTextOfExperienceYearOnCoachingDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfExperienceYearOnCoachingDetailEditingPopUpEvent(
      TextOfExperienceYearOnCoachingDetailEditingPopUpSubmit event,
      Emitter<TextOfExperienceYearOnCoachingDetailEditingPopUpState> emit) {
    //
    // print('experienceYear is: ${event.fieldText}');
    emit(state.copyWith(experienceYear: event.fieldText));
  }

  FutureOr<void> _onTextOfExperienceYearOnCoachingDetailEditingPopUpClear(
      TextOfExperienceYearOnCoachingDetailEditingPopUpClear event,
      Emitter<TextOfExperienceYearOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(experienceYear: ''));
    //
    //print('name is: $state');
  }
}
