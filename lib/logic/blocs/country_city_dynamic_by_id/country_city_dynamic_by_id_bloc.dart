import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'country_city_dynamic_by_id_event.dart';
part 'country_city_dynamic_by_id_state.dart';

class CountryCityDynamicByIdBloc
    extends Bloc<CountryCityDynamicByIdEvent, CountryCityDynamicByIdState> {
  final Repositories _repositories = Repositories();

  CountryCityDynamicByIdBloc()
      : super(const CountryCityDynamicByIdState(status: Status.initial)) {
    on<LoadCountryCityDynamicByIdEvent>(_onLoadCountryCityDynamicById);
  }

  FutureOr<void> _onLoadCountryCityDynamicById(
      event, Emitter<CountryCityDynamicByIdState> emit) async {
    emit(const CountryCityDynamicByIdState(status: Status.loading));

    try {
      final countryCityDynamicByIdListResponses = await _repositories
          .getCountryCityDynamicDataById(event.countryCityId);

      emit(
        state.copyWith(
            status: Status.success,
            countryCityDynamicByIdList: countryCityDynamicByIdListResponses),
      );
    } catch (e) {
      CountryCityDynamicByIdState(status: Status.failure, error: e.toString());
    }
  }
}
