import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'find_a_coach_message_dynamic_by_find_a_coach_conversation_event.dart';
part 'find_a_coach_message_dynamic_by_find_a_coach_conversation_state.dart';

class FindACoachMessageDynamicByFindACoachConversationBloc extends Bloc<
    FindACoachMessageDynamicByFindACoachConversationEvent,
    FindACoachMessageDynamicByFindACoachConversationState> {
  final Repositories _repositories = Repositories();

  FindACoachMessageDynamicByFindACoachConversationBloc()
      : super(const FindACoachMessageDynamicByFindACoachConversationState(
            status: StatusWithoutLoading.initial)) {
    on<LoadFindACoachMessageDynamicByFindACoachConversationEvent>(
        _onLoadFindACoachMessageDynamicByFindACoachConversation);
    on<CleanFindACoachMessageDynamicByFindACoachConversation>(
        _onCleanFindACoachMessageDynamicByFindACoachConversation);
  }

  FutureOr<void> _onLoadFindACoachMessageDynamicByFindACoachConversation(
      event,
      Emitter<FindACoachMessageDynamicByFindACoachConversationState>
          emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final findACoachMessageDynamicByFindACoachConversationListResponses =
            await _repositories
                .getFindACoachMessageDynamicDataByFindACoachConversation(
                    event.traineeId,
                    event.findACoachConversationId,
                    event.offset);
        return findACoachMessageDynamicByFindACoachConversationListResponses
                    .isEmpty ||
                findACoachMessageDynamicByFindACoachConversationListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferMessageDynamicList:
                    findACoachMessageDynamicByFindACoachConversationListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferMessageDynamicList:
                    findACoachMessageDynamicByFindACoachConversationListResponses,
                hasReachedMax: false));
      }
      final findACoachMessageDynamicByFindACoachConversationListResponses =
          await _repositories
              .getFindACoachMessageDynamicDataByFindACoachConversation(
                  event.traineeId,
                  event.findACoachConversationId,
                  event.offset);
      findACoachMessageDynamicByFindACoachConversationListResponses.isEmpty ||
              findACoachMessageDynamicByFindACoachConversationListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferMessageDynamicList: List.of(
                  state.trainingOfferMessageDynamicList)
                ..addAll(
                    findACoachMessageDynamicByFindACoachConversationListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferMessageDynamicList: List.of(
                  state.trainingOfferMessageDynamicList)
                ..addAll(
                    findACoachMessageDynamicByFindACoachConversationListResponses),
              hasReachedMax: false));
    } catch (e) {
      FindACoachMessageDynamicByFindACoachConversationState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanFindACoachMessageDynamicByFindACoachConversation(
      CleanFindACoachMessageDynamicByFindACoachConversation event,
      Emitter<FindACoachMessageDynamicByFindACoachConversationState> emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingOfferMessageDynamicList:
            List.of(state.trainingOfferMessageDynamicList..clear()),
        hasReachedMax: false));
  }
}




  // FutureOr<void>
  //     _onLoadFindACoachMessageDynamicByFindACoachConversation(
  //         event,
  //         Emitter<FindACoachMessageDynamicByFindACoachConversationState>
  //             emit) async {
  //   emit(const FindACoachMessageDynamicByFindACoachConversationState(
  //       status: Status.loading));

  //   try {
  //     final findACoachMessageDynamicByFindACoachConversationListResponses =
  //         await _repositories
  //             .getFindACoachMessageDynamicDataByFindACoachConversation(
  //                 event.traineeId, event.findACoachConversationId, event.offset);
  //     //
  //     // if (kDebugMode) {
  //     //   print(
  //     //       'findACoachMessageDynamicByFindACoachConversationListResponses: $findACoachMessageDynamicByFindACoachConversationListResponses');
  //     // }
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingOfferMessageDynamicList:
  //               findACoachMessageDynamicByFindACoachConversationListResponses),
  //     );
  //   } catch (e) {
  //     FindACoachMessageDynamicByFindACoachConversationState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }