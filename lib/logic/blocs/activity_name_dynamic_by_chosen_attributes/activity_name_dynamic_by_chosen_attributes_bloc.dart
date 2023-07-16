import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_chosen_attributes_event.dart';
part 'activity_name_dynamic_by_chosen_attributes_state.dart';

class ActivityNameDynamicByChosenAttributesBloc extends Bloc<
    ActivityNameDynamicByChosenAttributesEvent,
    ActivityNameDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  ActivityNameDynamicByChosenAttributesBloc()
      : super(const ActivityNameDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadActivityNameDynamicByChosenAttributesEvent>(
        onLoadActivityNameDynamic);
  }

  FutureOr<void> onLoadActivityNameDynamic(
      event, Emitter<ActivityNameDynamicByChosenAttributesState> emit) async {
    emit(const ActivityNameDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      // This code added not to be crashed the app, or not to emit different activityNameDynamic model in the state of activityNameDynamicList.It should be checked!!!
      if (state.activityNameDynamicList.isNotEmpty) {
        state.copyWith(
            activityNameDynamicList: List.of(state.activityNameDynamicList)
              ..clear());
      }

      final allActivityNameDynamicResponses = await _repositories
          .getActivityNameDynamicByChosenAttributes(event.activityNameId);

      emit(state.copyWith(
          status: Status.success,
          activityNameDynamicList: allActivityNameDynamicResponses));
    } catch (e) {
      ActivityNameDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
