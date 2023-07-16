import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'dropdown_of_gender_on_personal_detail_editing_pop_up_event.dart';
part 'dropdown_of_gender_on_personal_detail_editing_pop_up_state.dart';

class DropdownOfGenderOnPersonalDetailEditingPopUpBloc extends Bloc<
    DropdownOfGenderOnPersonalDetailEditingPopUpEvent,
    DropdownOfGenderOnPersonalDetailEditingPopUpState> {
  DropdownOfGenderOnPersonalDetailEditingPopUpBloc()
      : super(DropdownOfGenderOnPersonalDetailEditingPopUpState()) {
    on<DropdownOfGenderOnPersonalDetailEditingPopUpSubmit>(
        _onDropdownOfGenderOnPersonalDetailEditingPopUpSubmit);
    on<DropdownOfGenderOnPersonalDetailEditingPopUpClear>(
        _onDropdownOfGenderOnPersonalDetailEditingPopUpClear);
    // on<DropdownOfGenderOnPersonalDetailEditingPopUpCompleted>(
    //     _onDropdownOfGenderOnPersonalDetailEditingPopUpCompleted);
  }

  FutureOr<void> _onDropdownOfGenderOnPersonalDetailEditingPopUpSubmit(
      DropdownOfGenderOnPersonalDetailEditingPopUpSubmit event,
      Emitter<DropdownOfGenderOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: event.fieldText));
  }

  FutureOr<void> _onDropdownOfGenderOnPersonalDetailEditingPopUpClear(
      DropdownOfGenderOnPersonalDetailEditingPopUpClear event,
      Emitter<DropdownOfGenderOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: ''));
  }

  // FutureOr<void> _onDropdownOfGenderOnPersonalDetailEditingPopUpCompleted(
  //     DropdownOfGenderOnPersonalDetailEditingPopUpCompleted event,
  //     Emitter<DropdownOfGenderOnPersonalDetailEditingPopUpState> emit) {
  //   emit(state.copyWith(fieldText: ''));
  // }
}
