import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repositories _repositories = Repositories();

  UserBloc() : super(const UserState(status: Status.initial)) {
    on<LoadUserEvent>(_onLoadUser);
    on<RecallUserEvent>(_onRecallUserEvent);
  }

  FutureOr<void> _onLoadUser(event, Emitter<UserState> emit) async {
    emit(const UserState(status: Status.loading));

    try {
      final userListResponses =
          await _repositories.getUserDataByUser(event.uId);
      emit(state.copyWith(
          status: Status.success, userList: List.from(userListResponses)));
    } catch (e) {
      UserState(status: Status.failure, error: e.toString());
    }
  }

  FutureOr<void> _onRecallUserEvent(
      RecallUserEvent event, Emitter<UserState> emit) {
    //
    // print('before ${state.status}');
    emit(state.copyWith(
        status: Status.initial, userList: List.from(state.userList..clear())));
    //
    //print('after ${state.status}');
  }
}
