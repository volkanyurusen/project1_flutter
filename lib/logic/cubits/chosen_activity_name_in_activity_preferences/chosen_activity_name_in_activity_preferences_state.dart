part of 'chosen_activity_name_in_activity_preferences_cubit.dart';

class ChosenActivityNameInActivityPreferencesState extends Equatable {
  final List<String> chosenActivityTitleInActivityPreferences;

  const ChosenActivityNameInActivityPreferencesState({
    required this.chosenActivityTitleInActivityPreferences,
  });

  @override
  List<Object?> get props => [chosenActivityTitleInActivityPreferences];

  ChosenActivityNameInActivityPreferencesState copyWith({
    List<String>? chosenActivityTitleInActivityPreferences,
  }) {
    return ChosenActivityNameInActivityPreferencesState(
      chosenActivityTitleInActivityPreferences:
          chosenActivityTitleInActivityPreferences ??
              this.chosenActivityTitleInActivityPreferences,
    );
  }

  @override
  String toString() =>
      'ChosenActivityNameInActivityPreferencesState(chosenActivityTitleInActivityPreferences: $chosenActivityTitleInActivityPreferences)';
}
