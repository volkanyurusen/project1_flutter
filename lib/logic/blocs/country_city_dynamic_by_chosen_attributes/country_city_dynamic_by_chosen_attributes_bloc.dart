import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'country_city_dynamic_by_chosen_attributes_event.dart';
part 'country_city_dynamic_by_chosen_attributes_state.dart';

class CountryCityDynamicByChosenAttributesBloc extends Bloc<
    CountryCityDynamicByChosenAttributesEvent,
    CountryCityDynamicByChosenAttributesState> {
  final Repositories _repositories = Repositories();

  CountryCityDynamicByChosenAttributesBloc()
      : super(const CountryCityDynamicByChosenAttributesState(
            status: Status.initial)) {
    on<LoadCountryCityDynamicByChosenAttributesEvent>(onLoadCountryCityDynamic);
  }

  FutureOr<void> onLoadCountryCityDynamic(
      event, Emitter<CountryCityDynamicByChosenAttributesState> emit) async {
    emit(const CountryCityDynamicByChosenAttributesState(
        status: Status.loading));

    try {
      final allCountryCityDynamicResponses =
          await _repositories.getCountryCityDynamicByChosenAttributes(
              event.cityId, event.countryId);

      emit(state.copyWith(
          status: Status.success,
          countryCityDynamicList: allCountryCityDynamicResponses));
    } catch (e) {
      CountryCityDynamicByChosenAttributesState(
          status: Status.failure, error: e.toString());
    }
  }
}
