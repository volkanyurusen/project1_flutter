part of 'country_city_dynamic_by_id_bloc.dart';

class CountryCityDynamicByIdState extends Equatable {
  final List<CountryCityDynamic> countryCityDynamicByIdList;
  final String error;
  final Status status;

  const CountryCityDynamicByIdState({
    this.countryCityDynamicByIdList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CountryCityDynamicByIdState copyWith({
    List<CountryCityDynamic>? countryCityDynamicByIdList,
    String? error,
    Status? status,
  }) {
    return CountryCityDynamicByIdState(
      countryCityDynamicByIdList:
          countryCityDynamicByIdList ?? this.countryCityDynamicByIdList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [countryCityDynamicByIdList, error, status];

  @override
  String toString() =>
      'CountryCityDynamicByIdState(countryCityDynamicByIdList: $countryCityDynamicByIdList, error: $error, status: $status)';
}
