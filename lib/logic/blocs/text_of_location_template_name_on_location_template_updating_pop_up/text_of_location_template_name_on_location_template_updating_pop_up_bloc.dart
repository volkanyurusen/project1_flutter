import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/constants/constants.dart';

part 'text_of_location_template_name_on_location_template_updating_pop_up_event.dart';
part 'text_of_location_template_name_on_location_template_updating_pop_up_state.dart';

class TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc extends Bloc<
        TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent,
        TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>
    with TemplateNameValidationMixin {
  TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc()
      : super(TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState()) {
    on<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit>(
        _onTextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent);
    on<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpClear>(
        _onTextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpClear);
  }

  FutureOr<void>
      _onTextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpEvent(
          TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpSubmit event,
          Emitter<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>
              emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpClear(
          TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpClear event,
          Emitter<TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
