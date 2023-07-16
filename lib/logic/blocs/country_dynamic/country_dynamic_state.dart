part of 'country_dynamic_bloc.dart';

class CountryDynamicState extends Equatable {
  final List<CountryDynamic> countryDynamicList;
  final String error;
  final Status status;

  const CountryDynamicState({
    this.countryDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CountryDynamicState copyWith({
    List<CountryDynamic>? countryDynamicList,
    String? error,
    Status? status,
  }) {
    return CountryDynamicState(
      countryDynamicList: countryDynamicList ?? this.countryDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [countryDynamicList, error, status];

  @override
  String toString() =>
      'CountryDynamicState(CountryDynamicList: $countryDynamicList, error: $error, status: $status)';
}
