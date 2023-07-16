import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_create_activity_screen_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_create_activity_screen_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenEvent,
        ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState> {
  final ActivityTypeDynamicButtonOnCreateActivityScreenBloc
      activityTypeDynamicButtonOnCreateActivityScreenBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnCreateActivityScreenStreamSubscribtion;

  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicByActivityTypeRepository
  //     _activityNameDynamicByActivityTypeRepository =
  //     ActivityNameDynamicByActivityTypeRepository();

  ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenBloc(
      {required this.activityTypeDynamicButtonOnCreateActivityScreenBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnCreateActivityScreenStreamSubscribtion =
        activityTypeDynamicButtonOnCreateActivityScreenBloc.stream.listen(
            (ActivityTypeDynamicButtonOnCreateActivityScreenState
                activityTypeDynamicButtonOnCreateActivityScreenState) {
      if (activityTypeDynamicButtonOnCreateActivityScreenState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnCreateActivityScreen has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnCreateActivityScreenState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreen);
  }

  FutureOr<void>
      onLoadActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreen(
          event,
          Emitter<ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState>
              emit) async {
    emit(
        const ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState(
            status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnCreateActivityScreenBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnCreateActivityScreenBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenResponses: $allActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnCreateActivityScreenStreamSubscribtion.cancel();
    return super.close();
  }
}
