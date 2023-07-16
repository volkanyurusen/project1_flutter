part of 'country_city_dynamic_by_chosen_attributes_bloc.dart';

class CountryCityDynamicByChosenAttributesState extends Equatable {
  final List<CountryCityDynamic> countryCityDynamicList;
  final String error;
  final Status status;

  const CountryCityDynamicByChosenAttributesState({
    this.countryCityDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CountryCityDynamicByChosenAttributesState copyWith({
    List<CountryCityDynamic>? countryCityDynamicList,
    String? error,
    Status? status,
  }) {
    return CountryCityDynamicByChosenAttributesState(
      countryCityDynamicList:
          countryCityDynamicList ?? this.countryCityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [countryCityDynamicList, error, status];

  @override
  String toString() =>
      'CountryCityDynamicByChosenAttributesState(countryCityDynamicList: $countryCityDynamicList, error: $error, status: $status)';
}
