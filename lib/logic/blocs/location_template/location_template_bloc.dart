import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'location_template_event.dart';
part 'location_template_state.dart';

class LocationTemplateBloc
    extends Bloc<LocationTemplateEvent, LocationTemplateState> {
  final Repositories _repositories = Repositories();

  LocationTemplateBloc()
      : super(const LocationTemplateState(status: Status.initial)) {
    on<AddLocationTemplateEvent>(_onAddLocationTemplateEvent);
    on<UpdateLocationTemplateEvent>(_onUpdateLocationTemplateEvent);
    on<DeleteLocationTemplateEvent>(_onDeleteLocationTemplateEvent);
  }

  FutureOr<void> _onAddLocationTemplateEvent(
      event, Emitter<LocationTemplateState> emit) async {
    emit(const LocationTemplateState(status: Status.loading));

    try {
      final allLocationDetailDynamicResponses =
          await _repositories.postLocationTemplate(event.locationTemplate);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allLocationDetailDynamicResponses));
    } catch (e) {
      LocationTemplateState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateLocationTemplateEvent(
      event, Emitter<LocationTemplateState> emit) async {
    emit(const LocationTemplateState(status: Status.loading));

    try {
      final allLocationDetailDynamicResponses =
          await _repositories.putLocationTemplate(event.locationTemplate);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allLocationDetailDynamicResponses));
    } catch (e) {
      LocationTemplateState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteLocationTemplateEvent(
      event, Emitter<LocationTemplateState> emit) async {
    emit(const LocationTemplateState(status: Status.loading));

    try {
      final allLocationDetailDynamicResponses =
          await _repositories.deleteLocationTemplate(event.locationTemplateId);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allLocationDetailDynamicResponses));
    } catch (e) {
      LocationTemplateState(status: Status.failure, error: e.toString());
    }
  }
}
