import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_name_surname_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_name_surname_on_personal_detail_editing_pop_up_state.dart';

class TextOfNameSurnameOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextOfNameSurnameOnPersonalDetailEditingPopUpEvent,
        TextOfNameSurnameOnPersonalDetailEditingPopUpState>
    with NameSurnameValidationMixin {
  TextOfNameSurnameOnPersonalDetailEditingPopUpBloc()
      : super(TextOfNameSurnameOnPersonalDetailEditingPopUpState()) {
    on<TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfNameSurnameOnPersonalDetailEditingPopUpSubmit);
    on<TextOfNameSurnameOnPersonalDetailEditingPopUpClear>(
        _onTextOfNameSurnameOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
      TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfNameSurnameOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('nameSurname is: ${event.fieldText}');
    emit(state.copyWith(nameSurname: event.fieldText));
  }

  FutureOr<void> _onTextOfNameSurnameOnPersonalDetailEditingPopUpClear(
      TextOfNameSurnameOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfNameSurnameOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(nameSurname: ''));
    //
    //print('name is: $state');
  }
}
