import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_about_yourself_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_about_yourself_on_personal_detail_editing_pop_up_state.dart';

class TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextOfAboutYourselfOnPersonalDetailEditingPopUpEvent,
        TextOfAboutYourselfOnPersonalDetailEditingPopUpState>
    with AboutYourselfValidationMixin {
  TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc()
      : super(TextOfAboutYourselfOnPersonalDetailEditingPopUpState()) {
    on<TextOfAboutYourselfOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfAboutYourselfOnPersonalDetailEditingPopUpEvent);
    on<TextOfAboutYourselfOnPersonalDetailEditingPopUpClear>(
        _onTextOfAboutYourselfOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfAboutYourselfOnPersonalDetailEditingPopUpEvent(
      TextOfAboutYourselfOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfAboutYourselfOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('aboutYourself is: ${event.fieldText}');
    emit(state.copyWith(aboutYourself: event.fieldText));
  }

  FutureOr<void> _onTextOfAboutYourselfOnPersonalDetailEditingPopUpClear(
      TextOfAboutYourselfOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfAboutYourselfOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(aboutYourself: ''));
    //
    //print('name is: $state');
  }
}
