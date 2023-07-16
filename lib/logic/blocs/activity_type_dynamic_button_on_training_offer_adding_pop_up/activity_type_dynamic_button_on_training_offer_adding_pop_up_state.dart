part of 'activity_type_dynamic_button_on_training_offer_adding_pop_up_bloc.dart';

class ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState
    extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState(
        chosenActivityTypeDynamicList:
            chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );

  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}
