// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'activity_tile.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblActivityTiles = 'tblActivityTiles';

class ActivityTileFields {
  static final List<String> values = [
    /// Add all fields here
    createdActivityId, hostId, username, picUrl, activityTitle, distanceBetween,
  ];

  static const String createdActivityId = 'created_activity_id';
  static const String hostId = 'host_id';
  static const String username = 'username';
  static const String picUrl = 'pic_url';
  static const String activityTitle = 'activity_title';
  static const String distanceBetween = 'distance_between';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class ActivityTile extends Equatable {
  final int? createdActivityId;
  final int hostId;
  final String username;
  final String picUrl;
  final String activityTitle;
  final double distanceBetween;

  const ActivityTile({
    this.createdActivityId,
    required this.hostId,
    required this.username,
    required this.picUrl,
    required this.activityTitle,
    required this.distanceBetween,
  });

  ActivityTile copy({
    int? createdActivityId,
    int? hostId,
    String? username,
    String? picUrl,
    String? activityTitle,
    double? distanceBetween,
  }) =>
      ActivityTile(
        createdActivityId: createdActivityId ?? this.createdActivityId,
        hostId: hostId ?? this.hostId,
        username: username ?? this.username,
        picUrl: picUrl ?? this.picUrl,
        activityTitle: activityTitle ?? this.activityTitle,
        distanceBetween: distanceBetween ?? this.distanceBetween,
      );

  factory ActivityTile.fromJson(Map<String, dynamic> json) =>
      _$ActivityTileFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityTileToJson(this);

  @override
  List<Object?> get props => [
        createdActivityId,
        hostId,
        username,
        picUrl,
        activityTitle,
        distanceBetween,
      ];

  @override
  String toString() {
    return 'ActivityTile(createdActivityId: $createdActivityId, hostId: $hostId, username: $username, picUrl: $picUrl, activityTitle: $activityTitle, distanceBetween: $distanceBetween)';
  }
}
