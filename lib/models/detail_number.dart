// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'detail_number.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblDetailNumbers = 'tblDetailNumbers';

class DetailNumberFields {
  static final List<String> values = [
    /// Add all fields here
    detail, number,
  ];

  static const String detail = 'detail';
  static const String number = 'number';
}

/// DetailNumber is created by getting number of activity's details on demonstrating
/// on the Search Screen.
///
// @JsonSerializable()
class DetailNumber extends Equatable {
  final String detail;
  final int number;

  const DetailNumber({
    required this.detail,
    required this.number,
  });

  DetailNumber copy({
    String? detail,
    int? number,
  }) =>
      DetailNumber(
        detail: detail ?? this.detail,
        number: number ?? this.number,
      );

  factory DetailNumber.fromJson(Map<String, dynamic> json) =>
      _$DetailNumberFromJson(json);

  Map<String, dynamic> toJson() => _$DetailNumberToJson(this);

  @override
  List<Object?> get props => [
        detail,
        number,
      ];

  @override
  String toString() => 'DetailNumber(detail: $detail, number: $number)';
}
