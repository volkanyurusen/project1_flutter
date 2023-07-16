part of 'activity_name_dynamic_by_activity_type_dynamic_on_training_offer_adding_pop_up_bloc.dart';

class ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState
    extends Equatable {
  final List<ActivityNameDynamic> activityNameDynamicList;
  final String error;
  final Status status;

  const ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState({
    this.activityNameDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState
      copyWith({
    List<ActivityNameDynamic>? activityNameDynamicList,
    String? error,
    Status? status,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState(
      activityNameDynamicList:
          activityNameDynamicList ??
              this.activityNameDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [activityNameDynamicList, error, status];

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpState(activityNameDynamicList: $activityNameDynamicList, error: $error, status: $status)';
}
