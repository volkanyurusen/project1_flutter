import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_address_on_personal_detail_editing_pop_up_event.dart';
part 'text_of_address_on_personal_detail_editing_pop_up_state.dart';

class TextOfAddressOnPersonalDetailEditingPopUpBloc extends Bloc<
        TextOfAddressOnPersonalDetailEditingPopUpEvent,
        TextOfAddressOnPersonalDetailEditingPopUpState>
    with AddressValidationMixin {
  TextOfAddressOnPersonalDetailEditingPopUpBloc()
      : super(TextOfAddressOnPersonalDetailEditingPopUpState()) {
    on<TextOfAddressOnPersonalDetailEditingPopUpSubmit>(
        _onTextOfAddressOnPersonalDetailEditingPopUpEvent);
    on<TextOfAddressOnPersonalDetailEditingPopUpClear>(
        _onTextOfAddressOnPersonalDetailEditingPopUpClear);
  }

  FutureOr<void> _onTextOfAddressOnPersonalDetailEditingPopUpEvent(
      TextOfAddressOnPersonalDetailEditingPopUpSubmit event,
      Emitter<TextOfAddressOnPersonalDetailEditingPopUpState> emit) {
    //
    // print('address is: ${event.fieldText}');
    emit(state.copyWith(address: event.fieldText));
  }

  FutureOr<void> _onTextOfAddressOnPersonalDetailEditingPopUpClear(
      TextOfAddressOnPersonalDetailEditingPopUpClear event,
      Emitter<TextOfAddressOnPersonalDetailEditingPopUpState> emit) {
    emit(state.copyWith(address: ''));
    //
    //print('name is: $state');
  }
}
