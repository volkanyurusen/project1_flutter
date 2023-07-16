import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'user_db_event.dart';
part 'user_db_state.dart';

class UserDBBloc extends Bloc<UserDBEvent, UserDBState> {
  final Repositories _repositories = Repositories();

  UserDBBloc() : super(const UserDBState(status: Status.initial)) {
    // on<AddUserDBEvent>(_onAddActivityDetailDynamic);
    on<UpdateUserDBEvent>(_onUpdateUserDBEvent);
    // on<DeleteUserDBEvent>(_onDeleteActivityDetailDynamic);
  }

  // FutureOr<void> _onAddActivityDetailDynamic(
  //     event, Emitter<UserDBState> emit) async {
  //   emit(const UserDBState(status: Status.loading));

  //   try {
  //     final allActivityDetailDynamicResponses =
  //         await _repositories.postUserDB(event.userDB);

  //     emit(state.copyWith(
  //         status: Status.success,
  //         dbStatusList: allActivityDetailDynamicResponses));
  //   } catch (e) {
  //     UserDBState(status: Status.failure, error: e.toString());
  //   }
  // }

  FutureOr<void> _onUpdateUserDBEvent(event, Emitter<UserDBState> emit) async {
    emit(const UserDBState(status: Status.loading));

    try {
      final allActivityDetailDynamicResponses =
          await _repositories.putUser(event.userDB);

      emit(state.copyWith(
          status: Status.success,
          dbStatusList: allActivityDetailDynamicResponses));
    } catch (e) {
      UserDBState(status: Status.failure, error: e.toString());
    }
  }

  // FutureOr<void> _onDeleteActivityDetailDynamic(
  //     event, Emitter<UserDBState> emit) async {
  //   emit(const UserDBState(status: Status.loading));

  //   try {
  //     final allActivityDetailDynamicResponses =
  //         await _repositories.deleteUserDB(event.userDBId);

  //     emit(state.copyWith(
  //         status: Status.success,
  //         dbStatusList: allActivityDetailDynamicResponses));
  //   } catch (e) {
  //     UserDBState(status: Status.failure, error: e.toString());
  //   }
  // }
}
