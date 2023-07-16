// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'db_status.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDBStatus = 'tblDBStatus';

class DBStatusFields {
  static final List<String> values = [
    /// Add all fields here
    id, message,
  ];

  static const String id = 'id';
  static const String message = 'message';
}

/// DBStatus is created by getting detail of CRUD post operation.
///
// @JsonSerializable()
class DBStatus extends Equatable {
  final int id;
  final String message;

  const DBStatus({
    required this.id,
    required this.message,
  });

  DBStatus copy({
    int? id,
    String? message,
  }) =>
      DBStatus(
        id: id ?? this.id,
        message: message ?? this.message,
      );

  factory DBStatus.fromJson(Map<String, dynamic> json) =>
      _$DBStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DBStatusToJson(this);

  @override
  List<Object?> get props => [id, message];

  @override
  String toString() => 'DBStatus(id: $id, message: $message)';
}
