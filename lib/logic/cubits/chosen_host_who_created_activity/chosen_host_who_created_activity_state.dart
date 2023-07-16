part of 'chosen_host_who_created_activity_cubit.dart';

class ChosenHostWhoCreatedActivityState extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      chosenConsistedActivityDynamicWithDistance;

  const ChosenHostWhoCreatedActivityState({
    required this.chosenConsistedActivityDynamicWithDistance,
  });

  ChosenHostWhoCreatedActivityState copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        chosenConsistedActivityDynamicWithDistance,
  }) {
    return ChosenHostWhoCreatedActivityState(
      chosenConsistedActivityDynamicWithDistance:
          chosenConsistedActivityDynamicWithDistance ??
              this.chosenConsistedActivityDynamicWithDistance,
    );
  }

  @override
  List<Object> get props => [chosenConsistedActivityDynamicWithDistance];
}
