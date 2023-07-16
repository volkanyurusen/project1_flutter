import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'user_liking_dynamic_by_user_event.dart';
part 'user_liking_dynamic_by_user_state.dart';

class UserLikingDynamicByUserBloc
    extends Bloc<UserLikingDynamicByUserEvent, UserLikingDynamicByUserState> {
  final Repositories _repositories = Repositories();

  UserLikingDynamicByUserBloc()
      : super(const UserLikingDynamicByUserState(status: Status.initial)) {
    on<LoadUserLikingDynamicByUserEvent>(_onLoadUserLikingDynamicByUser);
  }

  FutureOr<void> _onLoadUserLikingDynamicByUser(
      event, Emitter<UserLikingDynamicByUserState> emit) async {
    emit(const UserLikingDynamicByUserState(status: Status.loading));

    try {
      final userLikingDynamicByUserListResponses =
          await _repositories.getUserLikingDynamicDataByUser(event.uId);
      //
      // if (kDebugMode) {
      //   print(
      //       'userLikingDynamicByUserListResponses: $userLikingDynamicByUserListResponses');
      emit(
        state.copyWith(
            status: Status.success,
            userLikingDynamicList: userLikingDynamicByUserListResponses),
      );
    } catch (e) {
      UserLikingDynamicByUserState(status: Status.failure, error: e.toString());
    }
  }
}
