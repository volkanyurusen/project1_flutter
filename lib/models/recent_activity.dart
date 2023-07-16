// import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

part 'recent_activity.g.dart';

/// This field was created for database. It was determined the database table
/// and column name
///

const String tblRecentActivities = 'tblRecentActivities';

class RecentActivityFields {
  static final List<String> values = [
    /// Add all fields here
    recentActivityId, activityTitle, activityDurationName, activityLevelDetail,
    ageClassificationName,
    activityDate, timePeriodName,
  ];

  static const String recentActivityId = 'consisted_activity_id';
  static const String activityTitle = 'activity_title';
  static const String activityDurationName = 'activity_duration_name';
  static const String activityLevelDetail = 'activity_level_detail';
  static const String ageClassificationName = 'age_classification_name';
  static const String activityDate = 'activity_date';
  static const String timePeriodName = 'time_period_name';
}

/// When User click the button "Create Activity" this model is created. All created activity details
/// are stored in this table.
///
// @JsonSerializable()
class RecentActivity extends Equatable {
  final int? recentActivityId;
  final String
      activityTitle; // CreatedActivity / ActivityDetail / ActivityName / ActivityTitle
  final String activityDurationName;
  final String activityLevelDetail;
  final String ageClassificationName;
  final DateTime activityDate; // CreatedActivity / ActivityDate
  final String
      timePeriodName; // CreatedActivity / ActivityDetail / TimePeriod / TimePeriodName

  const RecentActivity({
    this.recentActivityId,
    required this.activityTitle,
    required this.activityDurationName,
    required this.activityLevelDetail,
    required this.ageClassificationName,
    required this.activityDate,
    required this.timePeriodName,
  });

  RecentActivity copy({
    int? recentActivityId,
    String? activityTitle,
    String? activityDurationName,
    String? activityLevelDetail,
    String? ageClassificationName,
    DateTime? activityDate,
    String? timePeriodName,
  }) =>
      RecentActivity(
        recentActivityId: recentActivityId ?? this.recentActivityId,
        activityTitle: activityTitle ?? this.activityTitle,
        activityDurationName: activityDurationName ?? this.activityDurationName,
        activityLevelDetail: activityLevelDetail ?? this.activityLevelDetail,
        ageClassificationName:
            ageClassificationName ?? this.ageClassificationName,
        activityDate: activityDate ?? this.activityDate,
        timePeriodName: timePeriodName ?? this.timePeriodName,
      );

  factory RecentActivity.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityFromJson(json);

  Map<String, dynamic> toJson() => _$RecentActivityToJson(this);

  @override
  List<Object?> get props => [
        recentActivityId,
        activityTitle,
        activityDurationName,
        activityLevelDetail,
        ageClassificationName,
        activityDate,
        timePeriodName
      ];
}
