part of 'city_dynamic_by_country_bloc.dart';

class CityDynamicByCountryState extends Equatable {
  final List<CityDynamic> cityDynamicList;
  final String error;
  final Status status;

  const CityDynamicByCountryState({
    this.cityDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CityDynamicByCountryState copyWith({
    List<CityDynamic>? cityDynamicList,
    String? error,
    Status? status,
  }) {
    return CityDynamicByCountryState(
      cityDynamicList:
          cityDynamicList ?? this.cityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [cityDynamicList, error, status];

  @override
  String toString() =>
      'CityDynamicByCountryState(cityDynamicList: $cityDynamicList, error: $error, status: $status)';
}
