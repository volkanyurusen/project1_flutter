part of 'city_dynamic_by_country_bloc.dart';

abstract class CityDynamicByCountryEvent extends Equatable {
  const CityDynamicByCountryEvent();

  @override
  List<Object> get props => [];
}

class LoadCityDynamicByCountryEvent
    extends CityDynamicByCountryEvent {
  final String countryDetail;

  const LoadCityDynamicByCountryEvent({
    required this.countryDetail,
  });

  @override
  List<Object> get props => [countryDetail];
}
