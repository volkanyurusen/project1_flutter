import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'dropdown_of_city_on_personal_detail_editing_pop_up_event.dart';
part 'dropdown_of_city_on_personal_detail_editing_pop_up_state.dart';

class DropdownOfCityOnPersonalDetailEditingPopUpBloc extends Bloc<
    DropdownOfCityOnPersonalDetailEditingPopUpEvent,
    DropdownOfCityOnPersonalDetailEditingPopUpState> {
  DropdownOfCityOnPersonalDetailEditingPopUpBloc()
      : super(DropdownOfCityOnPersonalDetailEditingPopUpState()) {
    on<DropdownOfCityOnPersonalDetailEditingPopUpSubmit>(
        _onDropdownOfCityOnPersonalDetailEditingPopUpSubmit);
    on<DropdownOfCityOnPersonalDetailEditingPopUpClear>(
        _onDropdownOfCityOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onDropdownOfCityOnPersonalDetailEditingPopUpSubmit(
      DropdownOfCityOnPersonalDetailEditingPopUpSubmit event,
      Emitter<DropdownOfCityOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: event.fieldText));
  }

  FutureOr<void> _onDropdownOfCityOnPersonalDetailEditingPopUpClear(
      DropdownOfCityOnPersonalDetailEditingPopUpClear event,
      Emitter<DropdownOfCityOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: ''));
  }
}
