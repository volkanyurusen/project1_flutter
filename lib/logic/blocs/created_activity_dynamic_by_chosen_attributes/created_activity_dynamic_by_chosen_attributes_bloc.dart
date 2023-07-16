import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'created_activity_dynamic_by_chosen_attributes_event.dart';
part 'created_activity_dynamic_by_chosen_attributes_state.dart';

class CreatedActivityDynamicByChosenAttributesBloc extends Bloc<
    CreatedActivityDynamicByChosenAttributesEvent,
    CreatedActivityDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  CreatedActivityDynamicByChosenAttributesBloc()
      : super(const CreatedActivityDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadCreatedActivityDynamicByChosenAttributesEvent>(
        _onLoadCreatedActivityDynamicByChosenAttributes);
  }

  FutureOr<void> _onLoadCreatedActivityDynamicByChosenAttributes(event,
      Emitter<CreatedActivityDynamicByChosenAttributesState> emit) async {
    emit(const CreatedActivityDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final createdActivityDynamicByChosenAttributesListResponses =
          await _repositories.getCreatedActivityDynamicDataByChosenAttributes(
              event.activityNameId, event.hostId);
      emit(
        state.copyWith(
            status: Status.success,
            createdActivityDynamicList:
                createdActivityDynamicByChosenAttributesListResponses),
      );
    } catch (e) {
      CreatedActivityDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
