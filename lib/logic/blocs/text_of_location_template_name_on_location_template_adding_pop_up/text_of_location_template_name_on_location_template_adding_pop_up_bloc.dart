import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_location_template_name_on_location_template_adding_pop_up_event.dart';
part 'text_of_location_template_name_on_location_template_adding_pop_up_state.dart';

class TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc extends Bloc<
        TextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent,
        TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState>
    with TemplateNameValidationMixin {
  TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc()
      : super(TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState()) {
    on<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit>(
        _onTextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent);
    on<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpClear>(
        _onTextOfLocationTemplateNameOnLocationTemplateAddingPopUpClear);
  }

  FutureOr<void>
      _onTextOfLocationTemplateNameOnLocationTemplateAddingPopUpEvent(
          TextOfLocationTemplateNameOnLocationTemplateAddingPopUpSubmit event,
          Emitter<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState>
              emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfLocationTemplateNameOnLocationTemplateAddingPopUpClear(
          TextOfLocationTemplateNameOnLocationTemplateAddingPopUpClear event,
          Emitter<TextOfLocationTemplateNameOnLocationTemplateAddingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
