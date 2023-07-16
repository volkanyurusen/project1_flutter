import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'user_dynamic_event.dart';
part 'user_dynamic_state.dart';

class UserDynamicBloc extends Bloc<UserDynamicEvent, UserDynamicState> {
  final Repositories _repositories = Repositories();

  UserDynamicBloc() : super(const UserDynamicState(status: Status.initial)) {
    on<LoadUserDynamicEvent>(_onLoadUserDynamicEvent);
    on<RecallUserDynamicEvent>(_onRecallUserDynamicEvent);
  }

  FutureOr<void> _onLoadUserDynamicEvent(
      event, Emitter<UserDynamicState> emit) async {
    emit(const UserDynamicState(status: Status.loading));

    try {
      final userDynamicListResponses =
          await _repositories.getUserDynamicDataByUser(event.uId);
      emit(
        state.copyWith(
            status: Status.success, userDynamicList: userDynamicListResponses),
      );
    } catch (e) {
      UserDynamicState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallUserDynamicEvent(
      RecallUserDynamicEvent event, Emitter<UserDynamicState> emit) {
    emit(state.copyWith(
        status: Status.initial,
        userDynamicList: List.of(state.userDynamicList..clear())));
  }
}
