import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_event.dart';
part 'activity_name_dynamic_by_activity_type_state.dart';

class ActivityNameDynamicByActivityTypeBloc extends Bloc<
    ActivityNameDynamicByActivityTypeEvent,
    ActivityNameDynamicByActivityTypeState> {
  final ActivityTypeDynamicButtonBloc activityTypeDynamicButtonBloc;
  late StreamSubscription activityTypeButtonStreamSubscribtion;

  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicByActivityTypeRepository
  //     _activityNameDynamicByActivityTypeRepository =
  //     ActivityNameDynamicByActivityTypeRepository();

  ActivityNameDynamicByActivityTypeBloc(
      {required this.activityTypeDynamicButtonBloc}) //
      : super(const ActivityNameDynamicByActivityTypeState(
            status: Status.initial)) {
    activityTypeButtonStreamSubscribtion = activityTypeDynamicButtonBloc.stream
        .listen(
            (ActivityTypeDynamicButtonState activityTypeDynamicButtonState) {
      if (activityTypeDynamicButtonState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print('ActivityTypeButton has not pressed yet');
        }
      } else if (activityTypeDynamicButtonState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeEvent>(
        onLoadActivityNameDynamicByActivityType);
  }

  FutureOr<void> onLoadActivityNameDynamicByActivityType(
      event, Emitter<ActivityNameDynamicByActivityTypeState> emit) async {
    emit(const ActivityNameDynamicByActivityTypeState(status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeResponses: $allActivityNameDynamicByActivityTypeResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeButtonStreamSubscribtion.cancel();
    return super.close();
  }
}
