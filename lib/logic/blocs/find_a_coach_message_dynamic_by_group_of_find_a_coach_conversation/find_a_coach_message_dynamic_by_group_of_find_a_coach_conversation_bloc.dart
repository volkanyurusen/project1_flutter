import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'find_a_coach_message_dynamic_by_group_of_find_a_coach_conversation_event.dart';
part 'find_a_coach_message_dynamic_by_group_of_find_a_coach_conversation_state.dart';

class FindACoachMessageDynamicByGroupOfFindACoachConversationBloc extends Bloc<
    FindACoachMessageDynamicByGroupOfFindACoachConversationEvent,
    FindACoachMessageDynamicByGroupOfFindACoachConversationState> {
  final Repositories _repositories = Repositories();

  FindACoachMessageDynamicByGroupOfFindACoachConversationBloc()
      : super(
            const FindACoachMessageDynamicByGroupOfFindACoachConversationState(
                status: Status.initial)) {
    on<LoadFindACoachMessageDynamicByGroupOfFindACoachConversationEvent>(
        _onLoadFindACoachMessageDynamicByGroupOfFindACoachConversation);
  }

  FutureOr<void> _onLoadFindACoachMessageDynamicByGroupOfFindACoachConversation(
      event,
      Emitter<FindACoachMessageDynamicByGroupOfFindACoachConversationState>
          emit) async {
    emit(const FindACoachMessageDynamicByGroupOfFindACoachConversationState(
        status: Status.loading));

    try {
      final findACoachMessageDynamicByGroupOfFindACoachConversationListResponses =
          await _repositories
              .getFindACoachMessageDynamicDataByGroupOfFindACoachConversation(
                  event.traineeId, event.findACoachConversationList);
      //
      // if (kDebugMode) {
      //   print(
      //       'findACoachMessageDynamicByGroupOfFindACoachConversationListResponses: $findACoachMessageDynamicByGroupOfFindACoachConversationListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            trainingOfferMessageDynamicList:
                findACoachMessageDynamicByGroupOfFindACoachConversationListResponses),
      );
    } catch (e) {
      FindACoachMessageDynamicByGroupOfFindACoachConversationState(
          status: Status.failure, error: e.toString());
    }
  }
}
