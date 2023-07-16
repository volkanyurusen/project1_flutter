import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'gender_dynamic_event.dart';
part 'gender_dynamic_state.dart';

class GenderDynamicBloc extends Bloc<GenderDynamicEvent, GenderDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final GenderDynamicRepository _genderDynamicRepository =
  //     GenderDynamicRepository();

  GenderDynamicBloc()
      : super(const GenderDynamicState(status: Status.initial)) {
    on<LoadGenderDynamicEvent>(_onLoadGenderDynamic);
  }

  FutureOr<void> _onLoadGenderDynamic(
      event, Emitter<GenderDynamicState> emit) async {
    emit(const GenderDynamicState(status: Status.loading));

    try {
      final allGenderDynamicResponses =
          await _repositories.getAllGenderDynamicData();
      //
      // await _genderDynamicRepository.getGenderDynamics();
      //
      // if (kDebugMode) {
      //   print('allGenderDynamicResponses: $allGenderDynamicResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          genderDynamicList: allGenderDynamicResponses));
    } catch (e) {
      GenderDynamicState(status: Status.failure, error: e.toString());
    }
  }
}
