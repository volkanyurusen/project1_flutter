part of 'activity_name_by_activity_type_button_on_activity_template_updating_pop_up_cubit.dart';

class ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props =>
      [chosenActivityTitleList];

  ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState(
      chosenActivityTitleList:
          chosenActivityTitleList ??
              this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState(chosenActivityTitleList: $chosenActivityTitleList)';
}
