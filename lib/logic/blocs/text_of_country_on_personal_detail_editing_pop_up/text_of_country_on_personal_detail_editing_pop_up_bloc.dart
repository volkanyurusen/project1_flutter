import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'text_of_country_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_country_on_personal_detail_editing_pop_up_state.dart';

class TextOfCountryOnPersonalDetailEditingPopUpBloc extends Bloc<
    TextOfCountryOnPersonalDetailEditingPopUpEvent,
    TextOfCountryOnPersonalDetailEditingPopUpState> {
  TextOfCountryOnPersonalDetailEditingPopUpBloc()
      : super(TextOfCountryOnPersonalDetailEditingPopUpState()) {
    on<TextOfCountryOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfCountryOnPersonalDetailEditingPopUpEvent);
    on<TextOfCountryOnPersonalDetailEditingPopUpClear>(
        _onTextOfCountryOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfCountryOnPersonalDetailEditingPopUpEvent(
      TextOfCountryOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfCountryOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('country is: ${event.fieldText}');
    emit(state.copyWith(country: event.fieldText));
  }

  FutureOr<void> _onTextOfCountryOnPersonalDetailEditingPopUpClear(
      TextOfCountryOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfCountryOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(country: ''));
    //
    //print('name is: $state');
  }
}
