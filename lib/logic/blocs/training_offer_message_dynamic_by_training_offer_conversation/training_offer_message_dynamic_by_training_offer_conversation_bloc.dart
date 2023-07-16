import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'training_offer_message_dynamic_by_training_offer_conversation_event.dart';
part 'training_offer_message_dynamic_by_training_offer_conversation_state.dart';

class TrainingOfferMessageDynamicByTrainingOfferConversationBloc extends Bloc<
    TrainingOfferMessageDynamicByTrainingOfferConversationEvent,
    TrainingOfferMessageDynamicByTrainingOfferConversationState> {
  final Repositories _repositories = Repositories();

  TrainingOfferMessageDynamicByTrainingOfferConversationBloc()
      : super(const TrainingOfferMessageDynamicByTrainingOfferConversationState(
            status: StatusWithoutLoading.initial)) {
    on<LoadTrainingOfferMessageDynamicByTrainingOfferConversationEvent>(
        _onLoadTrainingOfferMessageDynamicByTrainingOfferConversation);
    on<CleanTrainingOfferMessageDynamicByTrainingOfferConversation>(
        _onCleanTrainingOfferMessageDynamicByTrainingOfferConversation);
  }

  FutureOr<void> _onLoadTrainingOfferMessageDynamicByTrainingOfferConversation(
      event,
      Emitter<TrainingOfferMessageDynamicByTrainingOfferConversationState>
          emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == StatusWithoutLoading.initial) {
        final trainingOfferMessageDynamicByTrainingOfferConversationListResponses =
            await _repositories
                .getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
                    event.uId, event.trainingOfferConversationId, event.offset);
        return trainingOfferMessageDynamicByTrainingOfferConversationListResponses
                    .isEmpty ||
                trainingOfferMessageDynamicByTrainingOfferConversationListResponses
                        .length <
                    AppNumberConstants().queryLimit
            ? emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferMessageDynamicList:
                    trainingOfferMessageDynamicByTrainingOfferConversationListResponses,
                hasReachedMax: true))
            : emit(state.copyWith(
                status: StatusWithoutLoading.success,
                trainingOfferMessageDynamicList:
                    trainingOfferMessageDynamicByTrainingOfferConversationListResponses,
                hasReachedMax: false));
      }
      final trainingOfferMessageDynamicByTrainingOfferConversationListResponses =
          await _repositories
              .getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
                  event.uId, event.trainingOfferConversationId, event.offset);
      trainingOfferMessageDynamicByTrainingOfferConversationListResponses
                  .isEmpty ||
              trainingOfferMessageDynamicByTrainingOfferConversationListResponses
                      .length <
                  AppNumberConstants().queryLimit
          ? emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferMessageDynamicList: List.of(
                  state.trainingOfferMessageDynamicList)
                ..addAll(
                    trainingOfferMessageDynamicByTrainingOfferConversationListResponses),
              hasReachedMax: true))
          : emit(state.copyWith(
              status: StatusWithoutLoading.success,
              trainingOfferMessageDynamicList: List.of(
                  state.trainingOfferMessageDynamicList)
                ..addAll(
                    trainingOfferMessageDynamicByTrainingOfferConversationListResponses),
              hasReachedMax: false));
    } catch (e) {
      TrainingOfferMessageDynamicByTrainingOfferConversationState(
          status: StatusWithoutLoading.failure, error: e.toString());
    }
  }

  void _onCleanTrainingOfferMessageDynamicByTrainingOfferConversation(
      CleanTrainingOfferMessageDynamicByTrainingOfferConversation event,
      Emitter<TrainingOfferMessageDynamicByTrainingOfferConversationState>
          emit) {
    emit(state.copyWith(
        status: StatusWithoutLoading.initial,
        trainingOfferMessageDynamicList:
            List.of(state.trainingOfferMessageDynamicList..clear()),
        hasReachedMax: false));
  }
}




  // FutureOr<void>
  //     _onLoadTrainingOfferMessageDynamicByTrainingOfferConversation(
  //         event,
  //         Emitter<TrainingOfferMessageDynamicByTrainingOfferConversationState>
  //             emit) async {
  //   emit(const TrainingOfferMessageDynamicByTrainingOfferConversationState(
  //       status: Status.loading));

  //   try {
  //     final trainingOfferMessageDynamicByTrainingOfferConversationListResponses =
  //         await _repositories
  //             .getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
  //                 event.uId, event.trainingOfferConversationId, event.offset);
  //     //
  //     // if (kDebugMode) {
  //     //   print(
  //     //       'trainingOfferMessageDynamicByTrainingOfferConversationListResponses: $trainingOfferMessageDynamicByTrainingOfferConversationListResponses');
  //     // }
  //     emit(
  //       state.copyWith(
  //           status: Status.success,
  //           trainingOfferMessageDynamicList:
  //               trainingOfferMessageDynamicByTrainingOfferConversationListResponses),
  //     );
  //   } catch (e) {
  //     TrainingOfferMessageDynamicByTrainingOfferConversationState(
  //         status: Status.failure, error: e.toString());
  //   }
  // }