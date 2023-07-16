import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_by_activity_type_dynamic_on_training_offer_adding_pop_up_event.dart';
part 'activity_name_dynamic_by_activity_type_dynamic_on_training_offer_adding_pop_up_state.dart';

class ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpBloc
    extends Bloc<
        ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpEvent,
        ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState> {
  final ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc
      activityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc;
  late StreamSubscription
      activityTypeDynamicButtonOnTrainingOfferAddingPopUpStreamSubscribtion;

  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicByActivityTypeRepository
  //     _activityNameDynamicByActivityTypeRepository =
  //     ActivityNameDynamicByActivityTypeRepository();

  ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpBloc(
      {required this.activityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc}) //
      : super(
            const ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState(
                status: Status.initial)) {
    activityTypeDynamicButtonOnTrainingOfferAddingPopUpStreamSubscribtion =
        activityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc.stream.listen(
            (ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState
                activityTypeDynamicButtonOnTrainingOfferAddingPopUpState) {
      if (activityTypeDynamicButtonOnTrainingOfferAddingPopUpState
          .chosenActivityTypeDynamicList.isEmpty) {
        if (kDebugMode) {
          print(
              'ActivityTypeDynamicButtonOnTrainingOfferAddingPopUp has not pressed yet');
        }
      } else if (activityTypeDynamicButtonOnTrainingOfferAddingPopUpState
          .chosenActivityTypeDynamicList.isNotEmpty) {
        add(LoadActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpEvent());
      }
    });
    on<LoadActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpEvent>(
        onLoadActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUp);
  }

  FutureOr<void>
      onLoadActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUp(
          event,
          Emitter<ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState>
              emit) async {
    emit(
        const ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState(
            status: Status.loading));

    try {
      final allActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpResponses =
          await _repositories.getActivityNameDynamicDataByActivityType(
              activityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc
                  .state.chosenActivityTypeDynamicList);
      //
      // await _activityNameDynamicByActivityTypeRepository
      //     .getActivityNameDynamicByActivityTypes(
      //         activityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc
      //             .state.chosenActivityTypeDynamicList);
      //
      // if (kDebugMode) {
      // print('allActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpResponses: $allActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpResponses');
      // }
      emit(
        state.copyWith(
            status: Status.success,
            activityNameDynamicList:
                allActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpResponses),
      );
    } catch (e) {
      ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState(
          status: Status.failure, error: e.toString());
    }
  }

  @override
  Future<void> close() {
    activityTypeDynamicButtonOnTrainingOfferAddingPopUpStreamSubscribtion
        .cancel();
    return super.close();
  }
}
