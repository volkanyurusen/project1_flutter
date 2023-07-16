import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'text_of_gender_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_gender_on_personal_detail_editing_pop_up_state.dart';

class TextOfGenderOnPersonalDetailEditingPopUpBloc extends Bloc<
    TextOfGenderOnPersonalDetailEditingPopUpEvent,
    TextOfGenderOnPersonalDetailEditingPopUpState> {
  TextOfGenderOnPersonalDetailEditingPopUpBloc()
      : super(TextOfGenderOnPersonalDetailEditingPopUpState()) {
    on<TextOfGenderOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfGenderOnPersonalDetailEditingPopUpEvent);
    on<TextOfGenderOnPersonalDetailEditingPopUpClear>(
        _onTextOfGenderOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfGenderOnPersonalDetailEditingPopUpEvent(
      TextOfGenderOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfGenderOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('gender is: ${event.fieldText}');
    emit(state.copyWith(gender: event.fieldText));
  }

  FutureOr<void> _onTextOfGenderOnPersonalDetailEditingPopUpClear(
      TextOfGenderOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfGenderOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(gender: ''));
    //
    //print('name is: $state');
  }
}
