import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_conversation_event.dart';
part 'activity_conversation_state.dart';

class ActivityConversationBloc
    extends Bloc<ActivityConversationEvent, ActivityConversationState> {
  final Repositories _repositories = Repositories();

  ActivityConversationBloc()
      : super(const ActivityConversationState(status: Status.initial)) {
    on<AddActivityConversationEvent>(_onAddActivityConversationEvent);
    on<UpdateActivityConversationEvent>(_onUpdateActivityConversationEvent);
    on<DeleteActivityConversationEvent>(_onDeleteActivityConversationEvent);
  }

  FutureOr<void> _onAddActivityConversationEvent(
      event, Emitter<ActivityConversationState> emit) async {
    emit(const ActivityConversationState(status: Status.loading));

    try {
      final allActivityConversationResponses = await _repositories
          .postActivityConversation(event.activityConversation);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allActivityConversationResponses));
    } catch (e) {
      ActivityConversationState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onUpdateActivityConversationEvent(
      event, Emitter<ActivityConversationState> emit) async {
    emit(const ActivityConversationState(status: Status.loading));

    try {
      final allActivityConversationResponses = await _repositories
          .putActivityConversation(event.activityConversation);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allActivityConversationResponses));
    } catch (e) {
      ActivityConversationState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onDeleteActivityConversationEvent(
      event, Emitter<ActivityConversationState> emit) async {
    emit(const ActivityConversationState(status: Status.loading));

    try {
      final allActivityConversationResponses = await _repositories
          .deleteActivityConversation(event.activityConversationId);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allActivityConversationResponses));
    } catch (e) {
      ActivityConversationState(status: Status.failure, error: e.toString());
    }
  }
}
