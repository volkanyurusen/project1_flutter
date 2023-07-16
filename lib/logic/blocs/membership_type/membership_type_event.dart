part of 'membership_type_bloc.dart';

abstract class MembershipTypeEvent extends Equatable {
  const MembershipTypeEvent();

  @override
  List<Object> get props => [];
}

class LoadMembershipTypeEvent extends MembershipTypeEvent {}
