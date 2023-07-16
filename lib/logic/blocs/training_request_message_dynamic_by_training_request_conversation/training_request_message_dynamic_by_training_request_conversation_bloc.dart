import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_request_message_dynamic_by_training_request_conversation_event.dart';
part 'training_request_message_dynamic_by_training_request_conversation_state.dart';

class TrainingRequestMessageDynamicByTrainingRequestConversationBloc
    extends Bloc<
        TrainingRequestMessageDynamicByTrainingRequestConversationEvent,
        TrainingRequestMessageDynamicByTrainingRequestConversationState> {
  final Repositories _repositories = Repositories();

  TrainingRequestMessageDynamicByTrainingRequestConversationBloc()
      : super(
            const TrainingRequestMessageDynamicByTrainingRequestConversationState(
                status: StatusWithoutLoading.initial)) {
    on<LoadTrainingRequestMessageDynamicByTrainingRequestConversationEvent>(
        _onLoadTrainingRequestMessageDynamicByTrainingRequestConversation);
    on<CleanTrainingRequestMessageDynamicByTrainingRequestConversation>(
        _onCleanTrainingRequestMessageDynamicByTrainingRequestConversation);
  }

  FutureOr<void>
      _onLoadTrainingRequestMessageDynamicByTrainingRequestConversation(
          event,
          Emitter<TrainingRequestMessageDynamicByTrainingRequestConversationState>
              emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingRequestMessageDynamicByTrainingRequestConversationListResponses =
            await _repositories
                .getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
                    event.uId,
                    event.trainingRequestConversationId,
                    event.offset);
        return trainingRequestMessageDynamicByTrainingRequestConversationListResponses
                    .isEmpty ||
                trainingRequestMessageDynamicByTrainingRequestConversationListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestMessageDynamicList:
                    trainingRequestMessageDynamicByTrainingRequestConversationListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingRequestMessageDynamicList:
                    trainingRequestMessageDynamicByTrainingRequestConversationListResponses,
                hasReachedMax: false));
      }
      final trainingRequestMessageDynamicByTrainingRequestConversationListResponses =
          await _repositories
              .getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
                  event.uId, event.trainingRequestConversationId, event.offset);
      trainingRequestMessageDynamicByTrainingRequestConversationListResponses
                  .isEmpty ||
              trainingRequestMessageDynamicByTrainingRequestConversationListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestMessageDynamicList: List.of(
                  state.trainingRequestMessageDynamicList)
                ..addAll(
                    trainingRequestMessageDynamicByTrainingRequestConversationListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingRequestMessageDynamicList: List.of(
                  state.trainingRequestMessageDynamicList)
                ..addAll(
                    trainingRequestMessageDynamicByTrainingRequestConversationListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingRequestMessageDynamicByTrainingRequestConversationState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingRequestMessageDynamicByTrainingRequestConversation(
      CleanTrainingRequestMessageDynamicByTrainingRequestConversation event,
      Emitter<TrainingRequestMessageDynamicByTrainingRequestConversationState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingRequestMessageDynamicList:
            List.of(state.trainingRequestMessageDynamicList..clear()),
        hasReachedMax: false));
  }
}




  // FutureOr<void>
  //     _onLoadTrainingRequestMessageDynamicByTrainingRequestConversation(
  //         event,
  //         Emitter<TrainingRequestMessageDynamicByTrainingRequestConversationState>
  //             emit) async {
  //   emit(const TrainingRequestMessageDynamicByTrainingRequestConversationState(
  //       status: Status.loading));

  //   try {
  //     final trainingRequestMessageDynamicByTrainingRequestConversationListResponses =
  //         await _repositories
  //             .getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
  //                 event.uId, event.trainingRequestConversationId, event.offset);
  //     //
  //     // if (kDebugMode) {
  //     //   print(
  //     //       'trainingRequestMessageDynamicByTrainingRequestConversationListResponses: $trainingRequestMessageDynamicByTrainingRequestConversationListResponses');
  //     // }
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingRequestMessageDynamicList:
  //               trainingRequestMessageDynamicByTrainingRequestConversationListResponses),
  //     );
  //   } catch (e) {
  //     TrainingRequestMessageDynamicByTrainingRequestConversationState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }