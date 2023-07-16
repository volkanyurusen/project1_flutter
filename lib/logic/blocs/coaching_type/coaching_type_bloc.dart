import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'coaching_type_event.dart';
part 'coaching_type_state.dart';

class CoachingTypeBloc extends Bloc<CoachingTypeEvent, CoachingTypeState> {
  final Repositories _repositories = Repositories();
  //
  // final CoachingTypeRepository _coachingTypeRepository =
  //     CoachingTypeRepository();

  CoachingTypeBloc() : super(const CoachingTypeState(status: Status.initial)) {
    on<LoadCoachingTypeEvent>(_onLoadCoachingType);
  }

  FutureOr<void> _onLoadCoachingType(
      event, Emitter<CoachingTypeState> emit) async {
    emit(const CoachingTypeState(status: Status.loading));

    try {
      final allCoachingTypeResponses =
          await _repositories.getAllCoachingTypeData();
          //
          // await _coachingTypeRepository.getCoachingTypeData();
      //
      // if (kDebugMode) {
      //   print('allCoachingResponses: $allCoachingTypeResponses');
      // }
      emit(state.copyWith(
          status: Status.success, coachingTypeList: allCoachingTypeResponses));
    } catch (e) {
      CoachingTypeState(status: Status.failure, error: e.toString());
    }
  }
}
