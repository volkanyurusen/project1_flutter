import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'activity_name_dynamic_event.dart';
part 'activity_name_dynamic_state.dart';

class ActivityNameDynamicBloc
    extends Bloc<ActivityNameDynamicEvent, ActivityNameDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final ActivityNameDynamicRepository _activityNameDynamicRepository =
  //     ActivityNameDynamicRepository();

  ActivityNameDynamicBloc()
      : super(const ActivityNameDynamicState(status: Status.initial)) {
    on<LoadActivityNameDynamicEvent>(_onLoadActivityNameDynamic);
  }

  FutureOr<void> _onLoadActivityNameDynamic(
      event, Emitter<ActivityNameDynamicState> emit) async {
    emit(const ActivityNameDynamicState(status: Status.loading));

    try {
      final allActivityNameDynamicResponses =
          await _repositories.getAllActivityNameDynamicData();
      //
      // if (kDebugMode) {
      //   print('allActivityNameDynamicResponses: $allActivityNameDynamicResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          activityNameDynamicList: allActivityNameDynamicResponses));
    } catch (e) {
      ActivityNameDynamicState(status: Status.failure, error: e.toString());
    }
  }
}
