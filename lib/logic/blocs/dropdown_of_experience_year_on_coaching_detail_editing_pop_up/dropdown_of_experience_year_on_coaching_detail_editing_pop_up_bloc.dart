import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'dropdown_of_experience_year_on_coaching_detail_editing_pop_up_event.dart';
part 'dropdown_of_experience_year_on_coaching_detail_editing_pop_up_state.dart';

class DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc extends Bloc<
    DropdownOfExperienceYearOnCoachingDetailEditingPopUpEvent,
    DropdownOfExperienceYearOnCoachingDetailEditingPopUpState> {
  DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc()
      : super(DropdownOfExperienceYearOnCoachingDetailEditingPopUpState()) {
    on<DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit>(
        _onDropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit);
    on<DropdownOfExperienceYearOnCoachingDetailEditingPopUpClear>(
        _onDropdownOfExperienceYearOnCoachingDetailEditingPopUpClear);
    // on<DropdownOfExperienceYearOnCoachingDetailEditingPopUpCompleted>(
    //     _onDropdownOfExperienceYearOnCoachingDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onDropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit(
      DropdownOfExperienceYearOnCoachingDetailEditingPopUpSubmit event,
      Emitter<DropdownOfExperienceYearOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: event.fieldText));
  }

  FutureOr<void> _onDropdownOfExperienceYearOnCoachingDetailEditingPopUpClear(
      DropdownOfExperienceYearOnCoachingDetailEditingPopUpClear event,
      Emitter<DropdownOfExperienceYearOnCoachingDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: ''));
  }

  // FutureOr<void> _onDropdownOfExperienceYearOnCoachingDetailEditingPopUpCompleted(
  //     DropdownOfExperienceYearOnCoachingDetailEditingPopUpCompleted event,
  //     Emitter<DropdownOfExperienceYearOnCoachingDetailEditingPopUpState> emit) {
  //   emit(state.copyWith(fieldText: ''));
  // }
}
