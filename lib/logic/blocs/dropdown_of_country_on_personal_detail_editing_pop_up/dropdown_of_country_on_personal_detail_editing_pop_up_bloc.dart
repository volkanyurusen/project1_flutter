import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'dropdown_of_country_on_personal_detail_editing_pop_up_event.dart';
part 'dropdown_of_country_on_personal_detail_editing_pop_up_state.dart';

class DropdownOfCountryOnPersonalDetailEditingPopUpBloc extends Bloc<
        DropdownOfCountryOnPersonalDetailEditingPopUpEvent,
        DropdownOfCountryOnPersonalDetailEditingPopUpState>
    {
  DropdownOfCountryOnPersonalDetailEditingPopUpBloc()
      : super(DropdownOfCountryOnPersonalDetailEditingPopUpState()) {
    on<DropdownOfCountryOnPersonalDetailEditingPopUpSubmit>(
        _onDropdownOfCountryOnPersonalDetailEditingPopUpSubmit);
    on<DropdownOfCountryOnPersonalDetailEditingPopUpClear>(
        _onDropdownOfCountryOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onDropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
      DropdownOfCountryOnPersonalDetailEditingPopUpSubmit event,
      Emitter<DropdownOfCountryOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: event.fieldText));
  }

  FutureOr<void> _onDropdownOfCountryOnPersonalDetailEditingPopUpClear(
      DropdownOfCountryOnPersonalDetailEditingPopUpClear event,
      Emitter<DropdownOfCountryOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(fieldText: ''));
  }
}
