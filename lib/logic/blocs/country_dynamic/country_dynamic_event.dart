part of 'country_dynamic_bloc.dart';

abstract class CountryDynamicEvent extends Equatable {
  const CountryDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadCountryDynamicEvent extends CountryDynamicEvent {}
