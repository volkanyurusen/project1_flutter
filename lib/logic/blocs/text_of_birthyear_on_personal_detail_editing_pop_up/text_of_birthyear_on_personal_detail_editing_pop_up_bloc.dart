import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_birthyear_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_birthyear_on_personal_detail_editing_pop_up_state.dart';

class TextOfBirthyearOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextOfBirthyearOnPersonalDetailEditingPopUpEvent,
        TextOfBirthyearOnPersonalDetailEditingPopUpState>
    with BirthyearValidationMixin {
  TextOfBirthyearOnPersonalDetailEditingPopUpBloc()
      : super(TextOfBirthyearOnPersonalDetailEditingPopUpState()) {
    on<TextOfBirthyearOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfBirthyearOnPersonalDetailEditingPopUpEvent);
    on<TextOfBirthyearOnPersonalDetailEditingPopUpClear>(
        _onTextOfBirthyearOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfBirthyearOnPersonalDetailEditingPopUpEvent(
      TextOfBirthyearOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfBirthyearOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('birthyear is: ${event.fieldText}');
    emit(state.copyWith(birthyear: event.fieldText));
  }

  FutureOr<void> _onTextOfBirthyearOnPersonalDetailEditingPopUpClear(
      TextOfBirthyearOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfBirthyearOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(birthyear: ''));
    //
    //print('name is: $state');
  }
}
