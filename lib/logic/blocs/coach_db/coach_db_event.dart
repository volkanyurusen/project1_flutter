part of 'coach_db_bloc.dart';

abstract class CoachDBEvent extends Equatable {
  const CoachDBEvent();

  @override
  List<Object> get props => [];
}

// class AddCoachDBEvent extends CoachDBEvent {
//   final CoachDB coachDB;

//   const AddCoachDBEvent({
//     required this.coachDB,
//   });

//   @override
//   List<Object> get props => [coachDB];
// }

class UpdateCoachDBEvent extends CoachDBEvent {
  final CoachDB coachDB;

  const UpdateCoachDBEvent({
    required this.coachDB,
  });

  @override
  List<Object> get props => [coachDB];
}

// class DeleteCoachDBEvent extends CoachDBEvent {
//   final int coachDBId;

//   const DeleteCoachDBEvent({
//     required this.coachDBId,
//   });

//   @override
//   List<Object> get props => [coachDBId];
// }
