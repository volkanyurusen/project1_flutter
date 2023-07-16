import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_username_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_username_on_personal_detail_editing_pop_up_state.dart';

class TextOfUsernameOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextOfUsernameOnPersonalDetailEditingPopUpEvent,
        TextOfUsernameOnPersonalDetailEditingPopUpState>
    with UsernameValidationMixin {
  TextOfUsernameOnPersonalDetailEditingPopUpBloc()
      : super(TextOfUsernameOnPersonalDetailEditingPopUpState()) {
    on<TextOfUsernameOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfUsernameOnPersonalDetailEditingPopUpEvent);
    on<TextOfUsernameOnPersonalDetailEditingPopUpClear>(
        _onTextOfUsernameOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfUsernameOnPersonalDetailEditingPopUpEvent(
      TextOfUsernameOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfUsernameOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('Username is: ${event.fieldText}');
    emit(state.copyWith(username: event.fieldText));
  }

  FutureOr<void> _onTextOfUsernameOnPersonalDetailEditingPopUpClear(
      TextOfUsernameOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfUsernameOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(username: ''));
    //
    //print('name is: $state');
  }
}
