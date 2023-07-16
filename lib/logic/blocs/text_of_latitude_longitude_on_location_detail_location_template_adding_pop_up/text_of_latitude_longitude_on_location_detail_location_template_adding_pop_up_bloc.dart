import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';

part 'text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_event.dart';
part 'text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_state.dart';

class TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc
    extends Bloc<
        TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent,
        TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>
    with LatitudeLongitudeValidationMixin {
  TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc()
      : super(
            TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState()) {
    on<TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit>(
        _onTextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent);
    on<TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear>(
        _onTextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear);
  }

  FutureOr<void>
      _onTextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpEvent(
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpSubmit
              event,
          Emitter<TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>
              emit) {
    // print('templateName is: ${event.fieldText}');
    emit(state.copyWith(templateName: event.fieldText));
  }

  FutureOr<void>
      _onTextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear(
          TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear
              event,
          Emitter<TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpState>
              emit) {
    emit(state.copyWith(templateName: ''));
    // print('templateName is: $state.templateName!');
  }
}
