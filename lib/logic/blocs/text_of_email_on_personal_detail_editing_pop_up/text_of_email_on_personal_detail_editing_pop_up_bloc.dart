import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_email_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_email_on_personal_detail_editing_pop_up_state.dart';

class TextOfEmailOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextOfEmailOnPersonalDetailEditingPopUpEvent,
        TextOfEmailOnPersonalDetailEditingPopUpState>
    with EmailValidationMixin {
  TextOfEmailOnPersonalDetailEditingPopUpBloc()
      : super(TextOfEmailOnPersonalDetailEditingPopUpState()) {
    on<TextOfEmailOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfEmailOnPersonalDetailEditingPopUpEvent);
    on<TextOfEmailOnPersonalDetailEditingPopUpClear>(
        _onTextOfEmailOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfEmailOnPersonalDetailEditingPopUpEvent(
      TextOfEmailOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfEmailOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('email is: ${event.fieldText}');
    emit(state.copyWith(email: event.fieldText));
  }

  FutureOr<void> _onTextOfEmailOnPersonalDetailEditingPopUpClear(
      TextOfEmailOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfEmailOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(email: ''));
    //
    //print('name is: $state');
  }
}
