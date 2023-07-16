import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_conversation_dynamic_by_user_event.dart';
part 'activity_conversation_dynamic_by_user_state.dart';

class ActivityConversationDynamicByUserBloc extends Bloc<
    ActivityConversationDynamicByUserEvent,
    ActivityConversationDynamicByUserState> {
  final Repositories _repositories = Repositories();

  ActivityConversationDynamicByUserBloc()
      : super(const ActivityConversationDynamicByUserState(
            status: StatusWithoutLoading.initial)) {
    on<LoadActivityConversationDynamicByUserEvent>(
        _onLoadActivityConversationDynamicByUser);
    on<RecallActivityConversationDynamicByUserEvent>(
        _onRecallActivityConversationDynamicByUser);
  }

  FutureOr<void> _onLoadActivityConversationDynamicByUser(
      event, Emitter<ActivityConversationDynamicByUserState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final activityConversationDynamicByUserListResponses =
            await _repositories.getActivityConversationDynamicDataByUser(
                event.uId, event.offset);
        return activityConversationDynamicByUserListResponses.isEmpty ||
                activityConversationDynamicByUserListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                activityConversationDynamicList:
                    activityConversationDynamicByUserListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                activityConversationDynamicList:
                    activityConversationDynamicByUserListResponses,
                hasReachedMax: false));
      }
      final activityConversationDynamicByUserListResponses = await _repositories
          .getActivityConversationDynamicDataByUser(event.uId, event.offset);
      activityConversationDynamicByUserListResponses.isEmpty ||
              activityConversationDynamicByUserListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              activityConversationDynamicList:
                  List.of(state.activityConversationDynamicList)
                    ..addAll(activityConversationDynamicByUserListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              activityConversationDynamicList:
                  List.of(state.activityConversationDynamicList)
                    ..addAll(activityConversationDynamicByUserListResponses),
              hasReachedMax: false));
    } catch (e) {
      ActivityConversationDynamicByUserState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallActivityConversationDynamicByUser(
      RecallActivityConversationDynamicByUserEvent event,
      Emitter<ActivityConversationDynamicByUserState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        activityConversationDynamicList:
            List.of(state.activityConversationDynamicList)..clear(),
        hasReachedMax: false));
  }
}
