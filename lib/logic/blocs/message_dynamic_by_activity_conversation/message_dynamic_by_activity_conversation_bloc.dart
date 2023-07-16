import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'message_dynamic_by_activity_conversation_event.dart';
part 'message_dynamic_by_activity_conversation_state.dart';

class MessageDynamicByActivityConversationBloc extends Bloc<
    MessageDynamicByActivityConversationEvent,
    MessageDynamicByActivityConversationState> {
  final Repositories _repositories = Repositories();

  MessageDynamicByActivityConversationBloc()
      : super(const MessageDynamicByActivityConversationState(
            status: StatusWithoutLoading.initial)) {
    on<LoadMessageDynamicByActivityConversationEvent>(
        _onLoadMessageDynamicByActivityConversation);
    on<CleanMessageDynamicByActivityConversation>(
        _onCleanMessageDynamicByActivityConversation);
  }

  FutureOr<void> _onLoadMessageDynamicByActivityConversation(
      event, Emitter<MessageDynamicByActivityConversationState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final messageDynamicByActivityConversationListResponses =
            await _repositories.getMessageDynamicDataByActivityConversation(
                event.createdActivityId, event.offset);
        return messageDynamicByActivityConversationListResponses.isEmpty ||
                messageDynamicByActivityConversationListResponses.length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                messageDynamicList:
                    messageDynamicByActivityConversationListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                messageDynamicList:
                    messageDynamicByActivityConversationListResponses,
                hasReachedMax: false));
      }
      final messageDynamicByActivityConversationListResponses =
          await _repositories.getMessageDynamicDataByActivityConversation(
              event.createdActivityId, event.offset);
      messageDynamicByActivityConversationListResponses.isEmpty ||
              messageDynamicByActivityConversationListResponses.length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              messageDynamicList: List.of(state.messageDynamicList)
                ..addAll(messageDynamicByActivityConversationListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              messageDynamicList: List.of(state.messageDynamicList)
                ..addAll(messageDynamicByActivityConversationListResponses),
              hasReachedMax: false));
    } catch (e) {
      MessageDynamicByActivityConversationState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanMessageDynamicByActivityConversation(
      CleanMessageDynamicByActivityConversation event,
      Emitter<MessageDynamicByActivityConversationState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        messageDynamicList: List.of(state.messageDynamicList..clear()),
        hasReachedMax: false));
  }
}




  // FutureOr<void>
  //     _onLoadMessageDynamicByActivityConversation(
  //         event,
  //         Emitter<MessageDynamicByActivityConversationState>
  //             emit) async {
  //   emit(const MessageDynamicByActivityConversationState(
  //       status: Status.loading));

  //   try {
  //     final messageDynamicByActivityConversationListResponses =
  //         await _repositories
  //             .getMessageDynamicDataByActivityConversation(
  //                 event.createdActivityId, event.offset);
  //     //
  //     // if (kDebugMode) {
  //     //   print(
  //     //       'messageDynamicByActivityConversationListResponses: $messageDynamicByActivityConversationListResponses');
  //     // }
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           messageDynamicList:
  //               messageDynamicByActivityConversationListResponses),
  //     );
  //   } catch (e) {
  //     MessageDynamicByActivityConversationState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }