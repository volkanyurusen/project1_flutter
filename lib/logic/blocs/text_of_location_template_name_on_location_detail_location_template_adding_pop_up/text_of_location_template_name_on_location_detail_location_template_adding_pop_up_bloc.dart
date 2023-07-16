import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_location_template_name_on_location_detail_location_template_adding_pop_up_event.dart';
part 'text_of_location_template_name_on_location_detail_location_template_adding_pop_up_state.dart';

class TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
    extends Bloc<
        TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent,
        TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>
    with TemplateNameValidationMixin {
  TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc()
      : super(
            TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState()) {
    on<TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit>(
        _onTextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent);
    on<TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear>(
        _onTextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear);
  }

  FutureOr<void>
      _onTextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpEvent(
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpSubmit
              event,
          Emitter<TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>
              emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear(
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear
              event,
          Emitter<TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
