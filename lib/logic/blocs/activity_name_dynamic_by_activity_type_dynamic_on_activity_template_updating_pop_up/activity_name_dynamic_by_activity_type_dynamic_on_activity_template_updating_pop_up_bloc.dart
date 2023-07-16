import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_activity_template_updating_pop_up_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_activity_template_updating_pop_up_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpEvent,
        ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState> {
  final ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc
      activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpStreamSubscribtion;
  final Repositories _repositories = Repositories();

  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc(
      {required this.activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpStreamSubscribtion =
        activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc.stream
            .listen((ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState
                activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState) {
      if (activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUp);
  }

  FutureOr<void>
      onLoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUp(
          event,
          Emitter<ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState>
              emit) async {
    emit(
        const ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState(
            status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpResponses: $allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpStreamSubscribtion
        .cancel();
    return super.close();
  }
}
