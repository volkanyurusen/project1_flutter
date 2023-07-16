import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_type_dynamic_event.dart';
part 'activity_type_dynamic_state.dart';

class ActivityTypeDynamicBloc
    extends Bloc<ActivityTypeDynamicEvent, ActivityTypeDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final ActivityTypeDynamicRepository _activityTypeDynamicRepository =
  //     ActivityTypeDynamicRepository();

  ActivityTypeDynamicBloc()
      : super(const ActivityTypeDynamicState(status: Status.initial)) {
    on<LoadActivityTypeDynamicEvent>(_onLoadActivityTypeDynamic);
  }

  FutureOr<void> _onLoadActivityTypeDynamic(
      event, Emitter<ActivityTypeDynamicState> emit) async {
    emit(const ActivityTypeDynamicState(status: Status.loading));

    try {
      final allActivityTypeDynamicResponses =
          await _repositories.getAllActivityTypeDynamicData();
      //
      // await _activityTypeDynamicRepository.getActivityTypeDynamics();
      //
      // if (kDebugMode) {
      //   print('allActivityTypeDynamicResponses: $allActivityTypeDynamicResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          activityTypeDynamicList: allActivityTypeDynamicResponses));
    } catch (e) {
      ActivityTypeDynamicState(status: Status.failure, error: e.toString());
    }
  }
}
