import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'country_dynamic_event.dart';
part 'country_dynamic_state.dart';

class CountryDynamicBloc
    extends Bloc<CountryDynamicEvent, CountryDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final CountryDynamicRepository _countryDynamicRepository =
  //     CountryDynamicRepository();

  CountryDynamicBloc()
      : super(const CountryDynamicState(status: Status.initial)) {
    on<LoadCountryDynamicEvent>(_onLoadCountryDynamic);
  }

  FutureOr<void> _onLoadCountryDynamic(
      event, Emitter<CountryDynamicState> emit) async {
    emit(const CountryDynamicState(status: Status.loading));

    try {
      final allCountryDynamicResponses =
          await _repositories.getAllCountryDynamicData();
      //
      // await _countryDynamicRepository.getCountryDynamics();
      //
      // if (kDebugMode) {
      //   print('allCountryDynamicResponses: $allCountryDynamicResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          countryDynamicList: allCountryDynamicResponses));
    } catch (e) {
      CountryDynamicState(status: Status.failure, error: e.toString());
    }
  }
}
