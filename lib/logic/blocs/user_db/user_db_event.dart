part of 'user_db_bloc.dart';

abstract class UserDBEvent extends Equatable {
  const UserDBEvent();

  @override
  List<Object> get props => [];
}

// class AddUserDBEvent extends UserDBEvent {
//   final UserDB userDB;

//   const AddUserDBEvent({
//     required this.userDB,
//   });

//   @override
//   List<Object> get props => [userDB];
// }

class UpdateUserDBEvent extends UserDBEvent {
  final UserDB userDB;

  const UpdateUserDBEvent({
    required this.userDB,
  });

  @override
  List<Object> get props => [userDB];
}

// class DeleteUserDBEvent extends UserDBEvent {
//   final int userDBId;

//   const DeleteUserDBEvent({
//     required this.userDBId,
//   });

//   @override
//   List<Object> get props => [userDBId];
// }
