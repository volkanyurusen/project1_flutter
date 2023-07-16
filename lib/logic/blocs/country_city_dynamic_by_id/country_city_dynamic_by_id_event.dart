part of 'country_city_dynamic_by_id_bloc.dart';

abstract class CountryCityDynamicByIdEvent extends Equatable {
  const CountryCityDynamicByIdEvent();

  @override
  List<Object> get props => [];
}

class LoadCountryCityDynamicByIdEvent extends CountryCityDynamicByIdEvent {
  final int countryCityDynamicByIdId;

  const LoadCountryCityDynamicByIdEvent({
    required this.countryCityDynamicByIdId,
  });

  @override
  List<Object> get props => [countryCityDynamicByIdId];
}
