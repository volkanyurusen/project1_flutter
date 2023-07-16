part of 'country_city_dynamic_by_chosen_attributes_bloc.dart';

abstract class CountryCityDynamicByChosenAttributesEvent extends Equatable {
  const CountryCityDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadCountryCityDynamicByChosenAttributesEvent
    extends CountryCityDynamicByChosenAttributesEvent {
  final int? countryCityId;
  final int cityId;
  final int countryId;

  const LoadCountryCityDynamicByChosenAttributesEvent({
    this.countryCityId,
    required this.cityId,
    required this.countryId,
  });

  @override
  List<Object> get props => [countryCityId!, cityId, countryId];
}
