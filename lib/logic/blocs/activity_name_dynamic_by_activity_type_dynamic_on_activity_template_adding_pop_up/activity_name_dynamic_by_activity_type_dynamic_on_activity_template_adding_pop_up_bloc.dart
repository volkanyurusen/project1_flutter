import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_activity_template_adding_pop_up_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_activity_template_adding_pop_up_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpEvent,
        ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState> {
  final ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc
      activityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnActivityTemplateAddingPopUpStreamSubscribtion;

  final Repositories _repositories = Repositories();

  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc(
      {required this.activityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnActivityTemplateAddingPopUpStreamSubscribtion =
        activityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc.stream
            .listen((ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState
                activityTypeDynamicButtonOnActivityTemplateAddingPopUpState) {
      if (activityTypeDynamicButtonOnActivityTemplateAddingPopUpState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnActivityTemplateAddingPopUp has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnActivityTemplateAddingPopUpState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUp);
  }

  FutureOr<void>
      onLoadActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUp(
          event,
          Emitter<ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState>
              emit) async {
    emit(
        const ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState(
            status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpResponses: $allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnActivityTemplateAddingPopUpStreamSubscribtion
        .cancel();
    return super.close();
  }
}
