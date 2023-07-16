import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_conversation_dynamic_by_chosen_attributes_event.dart';
part 'activity_conversation_dynamic_by_chosen_attributes_state.dart';

class ActivityConversationDynamicByChosenAttributesBloc extends Bloc<
    ActivityConversationDynamicByChosenAttributesEvent,
    ActivityConversationDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  ActivityConversationDynamicByChosenAttributesBloc()
      : super(const ActivityConversationDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadActivityConversationDynamicByChosenAttributesEvent>(
        _onLoadActivityConversationDynamicByChosenAttributes);
  }

  FutureOr<void> _onLoadActivityConversationDynamicByChosenAttributes(event,
      Emitter<ActivityConversationDynamicByChosenAttributesState> emit) async {
    emit(const ActivityConversationDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final activityConversationDynamicByChosenAttributesListResponses =
          await _repositories
              .getActivityConversationDynamicDataByChosenAttributes(
                  event.consistedActivityId);
      emit(
        state.copyWith(
            status: Status.success,
            activityConversationDynamicList:
                activityConversationDynamicByChosenAttributesListResponses),
      );
    } catch (e) {
      ActivityConversationDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
