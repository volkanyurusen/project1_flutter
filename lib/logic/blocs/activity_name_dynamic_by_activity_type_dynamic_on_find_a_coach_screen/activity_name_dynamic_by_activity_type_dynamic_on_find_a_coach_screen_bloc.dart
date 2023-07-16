import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_find_a_coach_screen_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_find_a_coach_screen_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenEvent,
        ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState> {
  final ActivityTypeDynamicButtonOnFindACoachScreenBloc
      activityTypeDynamicButtonOnFindACoachScreenBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnFindACoachScreenStreamSubscribtion;

  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicByActivityTypeRepository
  //     _activityNameDynamicByActivityTypeRepository =
  //     ActivityNameDynamicByActivityTypeRepository();

  ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc(
      {required this.activityTypeDynamicButtonOnFindACoachScreenBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnFindACoachScreenStreamSubscribtion =
        activityTypeDynamicButtonOnFindACoachScreenBloc.stream.listen(
            (ActivityTypeDynamicButtonOnFindACoachScreenState
                activityTypeDynamicButtonOnFindACoachScreenState) {
      if (activityTypeDynamicButtonOnFindACoachScreenState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnFindACoachScreen has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnFindACoachScreenState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnFindACoachScreen);
  }

  FutureOr<void> onLoadActivityNameDynamicByActivityTypeDynamicOnFindACoachScreen(
      event,
      Emitter<ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState>
          emit) async {
    emit(const ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState(
        status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnFindACoachScreenBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnFindACoachScreenBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenResponses: $allActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnFindACoachScreenStreamSubscribtion.cancel();
    return super.close();
  }
}
