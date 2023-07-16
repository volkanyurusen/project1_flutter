part of 'chosen_membership_type_cubit.dart';

class ChosenMembershipTypeState extends Equatable {
  final List<MembershipType> chosenMembershipTypeList;

  const ChosenMembershipTypeState({
    required this.chosenMembershipTypeList,
  });

  ChosenMembershipTypeState copyWith({
    List<MembershipType>? chosenMembershipTypeList,
  }) {
    return ChosenMembershipTypeState(
      chosenMembershipTypeList:
          chosenMembershipTypeList ?? this.chosenMembershipTypeList,
    );
  }

  @override
  List<Object> get props => [chosenMembershipTypeList];
}
