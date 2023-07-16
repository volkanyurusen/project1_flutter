import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'text_of_city_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_city_on_personal_detail_editing_pop_up_state.dart';

class TextOfCityOnPersonalDetailEditingPopUpBloc extends Bloc<
    TextOfCityOnPersonalDetailEditingPopUpEvent,
    TextOfCityOnPersonalDetailEditingPopUpState> {
  TextOfCityOnPersonalDetailEditingPopUpBloc()
      : super(TextOfCityOnPersonalDetailEditingPopUpState()) {
    on<TextOfCityOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfCityOnPersonalDetailEditingPopUpEvent);
    on<TextOfCityOnPersonalDetailEditingPopUpClear>(
        _onTextOfCityOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfCityOnPersonalDetailEditingPopUpEvent(
      TextOfCityOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfCityOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('city is: ${event.fieldText}');
    emit(state.copyWith(city: event.fieldText));
  }

  FutureOr<void> _onTextOfCityOnPersonalDetailEditingPopUpClear(
      TextOfCityOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfCityOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(city: ''));
    //
    //print('name is: $state');
  }
}
