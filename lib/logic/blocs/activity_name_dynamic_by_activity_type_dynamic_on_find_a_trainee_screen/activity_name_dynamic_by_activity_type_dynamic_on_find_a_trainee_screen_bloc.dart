import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_find_a_trainee_screen_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_find_a_trainee_screen_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenEvent,
        ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState> {
  final ActivityTypeDynamicButtonOnFindATraineeScreenBloc
      activityTypeDynamicButtonOnFindATraineeScreenBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnFindATraineeScreenStreamSubscribtion;

  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicByActivityTypeRepository
  //     _activityNameDynamicByActivityTypeRepository =
  //     ActivityNameDynamicByActivityTypeRepository();

  ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc(
      {required this.activityTypeDynamicButtonOnFindATraineeScreenBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnFindATraineeScreenStreamSubscribtion =
        activityTypeDynamicButtonOnFindATraineeScreenBloc.stream.listen(
            (ActivityTypeDynamicButtonOnFindATraineeScreenState
                activityTypeDynamicButtonOnFindATraineeScreenState) {
      if (activityTypeDynamicButtonOnFindATraineeScreenState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnFindATraineeScreen has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnFindATraineeScreenState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreen);
  }

  FutureOr<void> onLoadActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreen(
      event,
      Emitter<ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState>
          emit) async {
    emit(
        const ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState(
            status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnFindATraineeScreenBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnFindATraineeScreenBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenResponses: $allActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnFindATraineeScreenStreamSubscribtion.cancel();
    return super.close();
  }
}
