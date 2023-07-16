part of 'activity_name_dynamic_by_activity_type_dynamic_button_on_training_offer_adding_pop_up_cubit.dart';

class ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState
    extends Equatable {
  final List<String> chosenActivityTitleList;

  const ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState({
    required this.chosenActivityTitleList,
  });

  @override
  List<Object?> get props => [chosenActivityTitleList];

  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState
      copyWith({
    List<String>? chosenActivityTitleList,
  }) {
    return ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState(
      chosenActivityTitleList:
          chosenActivityTitleList ?? this.chosenActivityTitleList,
    );
  }

  @override
  String toString() =>
      'ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState(chosenActivityTitleList: $chosenActivityTitleList)';
}
