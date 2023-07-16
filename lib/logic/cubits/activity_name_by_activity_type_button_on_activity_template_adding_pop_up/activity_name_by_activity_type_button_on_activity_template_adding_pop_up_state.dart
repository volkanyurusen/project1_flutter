part of 'activity_name_by_activity_type_button_on_activity_template_adding_pop_up_cubit.dart';

class ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props =>
      [chosenActivityTitleList];

  ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState(
      chosenActivityTitleList:
          chosenActivityTitleList ??
              this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState(chosenActivityTitleList: $chosenActivityTitleList)';
}
