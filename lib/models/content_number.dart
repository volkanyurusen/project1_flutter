// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'content_number.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblContentNumber = 'tblContentNumber';

class ContentNumberFields {
  static final List<String> values = [
    /// Add all fields here
    no, idNo,
  ];

  static const String no = 'no';
  static const String idNo = 'idNo';
}

/// ContentNumber is created by getting detail of CRUD post operation.
///
// @JsonSerializable()
class ContentNumber extends Equatable {
  final int no;
  final int? idNo;

  const ContentNumber({
    required this.no,
    this.idNo,
  });

  ContentNumber copy({
    int? no,
    int? idNo,
  }) =>
      ContentNumber(
        no: no ?? this.no,
        idNo: idNo ?? this.idNo,
      );

  factory ContentNumber.fromJson(Map<String, dynamic> json) =>
      _$ContentNumberFromJson(json);

  Map<String, dynamic> toJson() => _$ContentNumberToJson(this);

  @override
  List<Object?> get props => [no, idNo];

  @override
  String toString() => 'ContentNumber(no: $no, idNo: $idNo)';
}
