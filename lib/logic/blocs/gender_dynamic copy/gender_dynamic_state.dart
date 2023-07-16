part of 'gender_dynamic_bloc.dart';

class GenderDynamicState extends Equatable {
  final List<GenderDynamic> genderDynamicList;
  final String error;
  final Status status;

  const GenderDynamicState({
    this.genderDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  GenderDynamicState copyWith({
    List<GenderDynamic>? genderDynamicList,
    String? error,
    Status? status,
  }) {
    return GenderDynamicState(
      genderDynamicList: genderDynamicList ?? this.genderDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [genderDynamicList, error, status];

  @override
  String toString() =>
      'GenderDynamicState(GenderDynamicList: $genderDynamicList, error: $error, status: $status)';
}
