import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'city_dynamic_by_country_event.dart';
part 'city_dynamic_by_country_state.dart';

class CityDynamicByCountryBloc
    extends Bloc<CityDynamicByCountryEvent, CityDynamicByCountryState> {
  final Repositories _repositories = Repositories();

  CityDynamicByCountryBloc()
      : super(const CityDynamicByCountryState(status: Status.initial)) {
    on<LoadCityDynamicByCountryEvent>(_onLoadCityDynamicByCountry);
  }

  FutureOr<void> _onLoadCityDynamicByCountry(
      event, Emitter<CityDynamicByCountryState> emit) async {
    emit(const CityDynamicByCountryState(status: Status.loading));

    try {
      final cityDynamicByCountryListResponses =
          await _repositories.getCityDynamicDataByCountry(event.countryDetail);

      emit(
        state.copyWith(
            status: Status.success,
            cityDynamicList: cityDynamicByCountryListResponses),
      );
    } catch (e) {
      CityDynamicByCountryState(status: Status.failure, error: e.toString());
    }
  }
}
