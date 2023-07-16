import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'message_dynamic_by_group_of_activity_conversation_event.dart';
part 'message_dynamic_by_group_of_activity_conversation_state.dart';

class MessageDynamicByGroupOfActivityConversationBloc extends Bloc<
    MessageDynamicByGroupOfActivityConversationEvent,
    MessageDynamicByGroupOfActivityConversationState> {
  final Repositories _repositories = Repositories();

  MessageDynamicByGroupOfActivityConversationBloc()
      : super(const MessageDynamicByGroupOfActivityConversationState(
            status: StatusWithoutLoading.initial)) {
    on<LoadMessageDynamicByGroupOfActivityConversationEvent>(
        _onLoadMessageDynamicByGroupOfActivityConversation);
    on<RecallMessageDynamicByGroupOfActivityConversationEvent>(
        _onRecallMessageDynamicByGroupOfActivityConversation);
  }

  FutureOr<void> _onLoadMessageDynamicByGroupOfActivityConversation(event,
      Emitter<MessageDynamicByGroupOfActivityConversationState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final messageDynamicByGroupOfActivityConversationListResponses =
            await _repositories
                .getMessageDynamicDataByGroupOfActivityConversation(
                    event.uId, event.offset);
        return messageDynamicByGroupOfActivityConversationListResponses
                    .isEmpty ||
                messageDynamicByGroupOfActivityConversationListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                messageDynamicList:
                    messageDynamicByGroupOfActivityConversationListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                messageDynamicList:
                    messageDynamicByGroupOfActivityConversationListResponses,
                hasReachedMax: false));
      }
      final messageDynamicByGroupOfActivityConversationListResponses =
          await _repositories
              .getMessageDynamicDataByGroupOfActivityConversation(
                  event.uId, event.offset);
      messageDynamicByGroupOfActivityConversationListResponses.isEmpty ||
              messageDynamicByGroupOfActivityConversationListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              messageDynamicList: List.of(state.messageDynamicList)
                ..addAll(
                    messageDynamicByGroupOfActivityConversationListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              messageDynamicList: List.of(state.messageDynamicList)
                ..addAll(
                    messageDynamicByGroupOfActivityConversationListResponses),
              hasReachedMax: false));
    } catch (e) {
      MessageDynamicByGroupOfActivityConversationState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallMessageDynamicByGroupOfActivityConversation(
      RecallMessageDynamicByGroupOfActivityConversationEvent event,
      Emitter<MessageDynamicByGroupOfActivityConversationState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.success,
        messageDynamicList: List.of(state.messageDynamicList)..clear(),
        hasReachedMax: false));
  }
}
