part of 'location_template_dynamic_by_user_bloc.dart';

class LocationTemplateDynamicByUserState extends Equatable {
  final List<LocationTemplateDynamic> locationTemplateDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const LocationTemplateDynamicByUserState({
    this.locationTemplateDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  LocationTemplateDynamicByUserState copyWith({
    List<LocationTemplateDynamic>? locationTemplateDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return LocationTemplateDynamicByUserState(
      locationTemplateDynamicList:
          locationTemplateDynamicList ?? this.locationTemplateDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [locationTemplateDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'LocationTemplateDynamicByUserState(clocationTemplateDynamicList: $locationTemplateDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
