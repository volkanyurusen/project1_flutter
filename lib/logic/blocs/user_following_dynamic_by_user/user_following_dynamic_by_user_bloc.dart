import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'user_following_dynamic_by_user_event.dart';
part 'user_following_dynamic_by_user_state.dart';

class UserFollowingDynamicByUserBloc extends Bloc<
    UserFollowingDynamicByUserEvent, UserFollowingDynamicByUserState> {
  final Repositories _repositories = Repositories();

  UserFollowingDynamicByUserBloc()
      : super(const UserFollowingDynamicByUserState(status: Status.initial)) {
    on<LoadUserFollowingDynamicByUserEvent>(_onLoadUserFollowingDynamicByUser);
  }

  FutureOr<void> _onLoadUserFollowingDynamicByUser(
      event, Emitter<UserFollowingDynamicByUserState> emit) async {
    emit(const UserFollowingDynamicByUserState(status: Status.loading));

    try {
      final userFollowingDynamicByUserListResponses =
          await _repositories.getUserFollowingDynamicDataByUser(event.uId);
      //
      // if (kDebugMode) {
      //   print(
      //       'userFollowingDynamicByUserListResponses: $userFollowingDynamicByUserListResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            userFollowingDynamicList: userFollowingDynamicByUserListResponses),
      );
    } catch (e) {
      UserFollowingDynamicByUserState(
          status: Status.failure, error: e.toString());
    }
  }
}
