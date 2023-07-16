part of 'membership_type_bloc.dart';

class MembershipTypeState extends Equatable {
  final List<MembershipType> membershipTypeList;
  final String error;
  final Status status;

  const MembershipTypeState({
    this.membershipTypeList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  MembershipTypeState copyWith({
    List<MembershipType>? membershipTypeList,
    String? error,
    Status? status,
  }) {
    return MembershipTypeState(
      membershipTypeList: membershipTypeList ?? this.membershipTypeList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [membershipTypeList, error, status];

  @override
  String toString() =>
      'MembershipTypeState(MembershipTypeList: $membershipTypeList, error: $error, status: $status)';
}
