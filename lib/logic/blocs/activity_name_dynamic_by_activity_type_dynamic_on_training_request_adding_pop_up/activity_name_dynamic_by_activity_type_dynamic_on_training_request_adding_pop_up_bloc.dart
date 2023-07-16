import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_training_request_adding_pop_up_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_training_request_adding_pop_up_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpEvent,
        ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState> {
  final ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc
      activityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnTrainingRequestAddingPopUpStreamSubscribtion;

  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicByActivityTypeRepository
  //     _activityNameDynamicByActivityTypeRepository =
  //     ActivityNameDynamicByActivityTypeRepository();

  ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpBloc(
      {required this.activityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnTrainingRequestAddingPopUpStreamSubscribtion =
        activityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc.stream.listen(
            (ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
                activityTypeDynamicButtonOnTrainingRequestAddingPopUpState) {
      if (activityTypeDynamicButtonOnTrainingRequestAddingPopUpState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnTrainingRequestAddingPopUp has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnTrainingRequestAddingPopUpState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUp);
  }

  FutureOr<void>
      onLoadActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUp(
          event,
          Emitter<ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState>
              emit) async {
    emit(
        const ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState(
            status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpResponses: $allActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnTrainingRequestAddingPopUpStreamSubscribtion
        .cancel();
    return super.close();
  }
}
