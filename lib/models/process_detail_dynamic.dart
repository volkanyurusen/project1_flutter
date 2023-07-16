// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'process_detail_dynamic.g.dart';

const String tblProcessDetails = 'tblProcessDetails';

class ProcessDetailDynamicFields {
  static final List<String> values = [
    /// Add all fields here
    processDetailId, processName,
  ];

  static const String processDetailId = 'process_detail_id';
  static const String processName = 'process_name';
}

@JsonSerializable()
class ProcessDetailDynamic extends Equatable {
  final int? processDetailId;
  final String processName;

  const ProcessDetailDynamic({
    this.processDetailId,
    required this.processName,
  });

  ProcessDetailDynamic copy({
    int? processDetailId,
    String? processName,
  }) =>
      ProcessDetailDynamic(
        processDetailId: processDetailId ?? this.processDetailId,
        processName: processName ?? this.processName,
      );

  factory ProcessDetailDynamic.fromJson(Map<String, dynamic> json) =>
      _$ProcessDetailDynamicFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessDetailDynamicToJson(this);

  @override
  List<Object?> get props => [
        processDetailId,
        processName,
      ];

  @override
  String toString() {
    return 'tblProcessDetails(process_detail_id: $processDetailId, process_name: $processName)';
  }
}
