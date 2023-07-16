import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_project/constants/app_colors.dart';

abstract class AppConstants {}

class AppTimeConstants extends AppConstants {
  static const Duration _timeOutDuration = Duration(seconds: 2);
  static const Duration _dbInitialDuration = Duration(seconds: 5);

  Duration get timeOutDuration => _timeOutDuration;
  Duration get dbInitialDuration => _dbInitialDuration;
}

class AppDateFormat extends AppConstants {
  static final DateFormat _pickerDateRangeFormat = DateFormat('dd, MMMM yyyy');
  static final DateFormat _queryDateFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _displayedDateFormat = DateFormat('dd MMM yy');
  static final DateFormat _monthAndDayOnly = DateFormat('dd MMM');
  static final DateFormat _monthAndDayWithDayName = DateFormat('EEE, dd MMM');
  static final DateFormat _hourAndMinutesOnly = DateFormat('Hm');
  static final DateFormat _displayedDateAndDayFormat =
      DateFormat('dd MMM yy, EEEE');
  static final DateFormat _displayedDayFormat = DateFormat('EEEE');

  DateFormat get pickerDateRangeFormat => _pickerDateRangeFormat;
  DateFormat get queryDateFormat => _queryDateFormat;
  DateFormat get displayedDateFormat => _displayedDateFormat;
  DateFormat get monthAndDayOnly => _monthAndDayOnly;
  DateFormat get monthAndDayWithDayName => _monthAndDayWithDayName;
  DateFormat get hourAndMinutesOnly => _hourAndMinutesOnly;
  DateFormat get displayedDateAndDayFormat => _displayedDateAndDayFormat;
  DateFormat get displayedDayFormat => _displayedDayFormat;
}

class AppDateConstants extends AppConstants {
  static const Duration _activityDayRangeBetweenStartAndEndDateZero =
      Duration(days: 0);
  static const Duration _activityDayRangeBetweenStartAndEndDateOne =
      Duration(days: 1);
  static const Duration _activityDayRangeBetweenStartAndEndDateTwo =
      Duration(days: 2);
  static const Duration _activityDayRangeBetweenStartAndEndDateThree =
      Duration(days: 3);
  static const Duration _activityDayRangeBetweenStartAndEndDateMax =
      Duration(days: 30);

  Duration get activityDayRangeBetweenStartAndEndDateZero =>
      _activityDayRangeBetweenStartAndEndDateZero;
  Duration get activityDayRangeBetweenStartAndEndDateOne =>
      _activityDayRangeBetweenStartAndEndDateOne;
  Duration get activityDayRangeBetweenStartAndEndDateTwo =>
      _activityDayRangeBetweenStartAndEndDateTwo;
  Duration get activityDayRangeBetweenStartAndEndDateThree =>
      _activityDayRangeBetweenStartAndEndDateThree;
  Duration get activityDayRangeBetweenStartAndEndDateMax =>
      _activityDayRangeBetweenStartAndEndDateMax;
}

class AppActivityInitialDateSelection extends AppConstants {
  static final DateTime _activityDefaultDate = AppDateFormat()
      .pickerDateRangeFormat
      .parse(AppDateFormat().pickerDateRangeFormat.format(DateTime.now()));
  DateTime get activityDefaultDate => _activityDefaultDate;
}

class AppListConstants extends AppConstants {
  static const List<String> _activityDefinedDate = [
    'Today',
    'Tomorrow',
    '2 Days Later',
    '3 Days Later',
  ];
  static const List<String> _displayedActivity = [
    'Single',
    'Multiple',
    'All',
  ];
  static const List<String> _activityTitle = [
    'Backgammon',
    'Billard',
    'Chess',
    'Draughts',
    'Go',
    'Aikido',
    'Box',
    'Capoeira',
    'Free_Fighting',
    'Judo',
    'Jujitsu',
    'Karate',
    'Kickboxing',
    'Kung_Fu',
    'MMA',
    'Muay_Thai',
    'Wresling',
    'Taekwondo',
    'Abseiling',
    'Ballooning',
    'Bungee_Jumping',
    'Canyoning',
    'Climbing',
    'Hang_Gliding',
    'Parachuting',
    'Paragliding',
    'Skydiving',
    'Windsuit_Flying',
    'Archery',
    'BMX',
    'Bowling',
    'Croquet',
    'Cycling_Outdoor',
    'Dancing',
    'Free_Running',
    'Frisbeeing',
    'Golf',
    'Gymnastic',
    'Horsing',
    'Jogging_Outdoor',
    'Riding_Electro_Scooter',
    'Riding_Motorbike',
    'Riding_Scooter',
    'Rollerblade',
    'Rollerskate',
    'Running_Outdoor',
    'Skateboarding',
    'Streching',
    'Table_Tennis',
    'Tennis',
    'Tracking',
    'Yoga',
    'American_Football',
    'Baseball',
    'Badminton',
    'Basketball',
    'Crickets',
    'Football',
    'Handball',
    'Hockey',
    'Rugby',
    'Voleyball',
    'Canoeing',
    'Fishing',
    'Flyboarding',
    'Foilsurfing',
    'Freediving',
    'Jet_Surfing',
    'Kayaking',
    'Kitesurfing',
    'Rafting',
    'Rowing',
    'Sailing',
    'Skuba_Diving',
    'Snorkeling',
    'Stand_Up_Paddleboarding',
    'Surfing',
    'Swimming',
    'Wakeboarding',
    'Water_Skiing',
    'Windsurfing',
    'Yatching',
    'Alpine_Skiing',
    'Biathlon',
    'Bobsleigh',
    'Cross_Country_Skiing',
    'Curling',
    'Figure_Skating',
    'Ice_Skating',
    'Luge',
    'Skeleton',
    'Skiing',
    'Sledging',
    'Snowboarding',
    'Speed_Skating',
    'Calisthenics',
    'Cardio',
    'Crossfit',
    'Cycling_in_Gym',
    'Jogging_in_Gym',
    'Hitt',
    'Powerlifting',
    'Running_in_Gym',
    'Walking_in_Gym',
    'Workout_Outdoor',
    'Workout_in_Gym',
  ];
  static const List<String> _activityTypeDetail = [
    'Board_Games',
    'Combat_Sports',
    'Extreme_Sports',
    'Physical_Sports',
    'Team_Sports',
    'Water_Sports',
    'Winter_Sports',
    'Workouts',
  ];
  static const List<String> _processDetailName = [
    'Requested',
    'Approved',
    'Denied',
  ];
  static const List<String> _coachingType = [
    'Basic Coach',
    'High Coach',
  ];

  static const List<String> _basicMembershipTypeValue = [
    ' times/per day',
    ' times/per day',
    '',
    '',
    ' km.',
    'None',
    '',
    '',
    ' time',
    'None',
    'None',
    '',
    '',
    '',
    '',
    '',
  ];

  static const List<String> _platinumMembershipTypeValue = [
    ' times/per day',
    ' /per day',
    '',
    '',
    ' km.',
    ' times/per month',
    '',
    '',
    ' times',
    ' activities',
    ' times',
    '',
    '',
    '',
    '',
    '',
  ];

  static const List<String> _basicCoachingTypeValue = [
    ' times/per day',
    '',
    '',
    ' km.',
    'None',
    '',
    '',
    'None',
    'None',
    '',
    '',
    '',
    '',
    '',
  ];

  static const List<String> _platinumCoachingTypeValue = [
    ' times/per day',
    '',
    '',
    ' km.',
    ' times/per month',
    '',
    '',
    ' times',
    ' activities',
    '',
    '',
    '',
    '',
    '',
  ];

  static final List<Icon> _typeIcon = [
    Icon(Icons.directions_run_outlined,
        color: AppColors().scaffoldBackgroundColor, size: 45),
    Icon(Icons.directions_bike_rounded,
        color: AppColors().scaffoldBackgroundColor, size: 45),
  ];

  static final List<Icon> _coachingTypeIcon = [
    Icon(Icons.directions_run_outlined,
        color: AppColors().scaffoldBackgroundColor, size: 45),
    Icon(Icons.directions_bike_rounded,
        color: AppColors().scaffoldBackgroundColor, size: 45),
  ];

  // Other alternative Icons
  // directions_walk_outlined
  // directions_run_outlined
  // directions_bike_rounded

  static final List<Color> _typeColor = [
    AppColors().textColor.withOpacity(0.75),
    AppColors().primary.withOpacity(0.75),
  ];

  static final List<Color> _coachingTypeColor = [
    AppColors().textColor.withOpacity(0.75),
    AppColors().primary.withOpacity(0.75),
  ];

  static const List<String> _typeSummaryDescription = [
    'Limited functions',
    'Able to use all functions'
  ];

  static const List<String> _coachingTypeSummaryDescription = [
    'Limited functions',
    'Able to use all functions'
  ];

  static final List<String> _dayDefinition = [
    'days ago',
    'Yesterday',
    'Today',
    'Tomorrow',
    'days later'
  ];

  static final List<Map<String, dynamic>> _activityDefinedDateList = [
    {
      _activityDefinedDate[0]: DateTime.now()
          .add(AppDateConstants._activityDayRangeBetweenStartAndEndDateZero)
    },
    {
      _activityDefinedDate[1]: DateTime.now()
          .add(AppDateConstants._activityDayRangeBetweenStartAndEndDateOne)
    },
    {
      _activityDefinedDate[2]: DateTime.now()
          .add(AppDateConstants._activityDayRangeBetweenStartAndEndDateTwo)
    },
    {
      _activityDefinedDate[3]: DateTime.now()
          .add(AppDateConstants._activityDayRangeBetweenStartAndEndDateThree)
    },
  ];

  // static const List<Map<String, dynamic>> _activityTitleTypeMap = [
  //   {'Calisthenics': 'Workouts'},
  //   {'Cardio': 'Workouts'},
  //   {'Crossfit': 'Workouts'},
  //   {'Cycling_in_Gym': 'Workouts'},
  //   {'Jogging_in_Gym': 'Workouts'},
  //   {'Hiit': 'Workouts'},
  //   {'Powerlifting': 'Workouts'},
  //   {'Running_in_Gym': 'Workouts'},
  //   {'Walking_in_Gym': 'Workouts'},
  //   {'Workout_in_Gym': 'Workouts'},
  //   {'Workout_Outdoor': 'Workouts'},
  //   {'Alpine_Skiing': 'Winter_Sports'},
  //   {'Biathlon': 'Winter_Sports'},
  //   {'Bobsleigh': 'Winter_Sports'},
  //   {'Cross_Country_Ski': 'Winter_Sports'},
  //   {'Curling': 'Winter_Sports'},
  //   {'Figure_Skating': 'Winter_Sports'},
  //   {'Ice_Skating': 'Winter_Sports'},
  //   {'Luge': 'Winter_Sports'},
  //   {'Skeleton': 'Winter_Sports'},
  //   {'Skiing': 'Winter_Sports'},
  //   {'Sledging': 'Winter_Sports'},
  //   {'Snowboarding': 'Winter_Sports'},
  //   {'Speed_Skating': 'Winter_Sports'},
  //   {'Canoeing': 'Water_Sports'},
  //   {'Fishing': 'Water_Sports'},
  //   {'Flyboarding': 'Water_Sports'},
  //   {'Freediving': 'Water_Sports'},
  //   {'Foilsurfing': 'Water_Sports'},
  //   {'Jet_Surfing': 'Water_Sports'},
  //   {'Kayaking': 'Water_Sports'},
  //   {'Kitesurfing': 'Water_Sports'},
  //   {'Rafting': 'Water_Sports'},
  //   {'Rowing': 'Water_Sports'},
  //   {'Sailing': 'Water_Sports'},
  //   {'Skuba_Diving': 'Water_Sports'},
  //   {'Snorkeling': 'Water_Sports'},
  //   {'Stand_Up_Paddleboarding': 'Water_Sports'},
  //   {'Surfing': 'Water_Sports'},
  //   {'Swimming': 'Water_Sports'},
  //   {'Wakeboarding': 'Water_Sports'},
  //   {'Water_Skiing': 'Water_Sports'},
  //   {'Windsurfing': 'Water_Sports'},
  //   {'Yatching': 'Water_Sports'},
  //   {'American_Football': 'Team_Sports'},
  //   {'Badminton': 'Team_Sports'},
  //   {'Baseball': 'Team_Sports'},
  //   {'Basketball': 'Team_Sports'},
  //   {'Boccia': 'Team_Sports'},
  //   {'Cricket': 'Team_Sports'},
  //   {'Flag_football': 'Team_Sports'},
  //   {'Floor_Hockey': 'Team_Sports'},
  //   {'Football': 'Team_Sports'},
  //   {'Handball': 'Team_Sports'},
  //   {'Hockey': 'Team_Sports'},
  //   {'Rugby': 'Team_Sports'},
  //   {'Futsal': 'Team_Sports'},
  //   {'Lawn_Bowls': 'Team_Sports'},
  //   {'Quidditch': 'Team_Sports'},
  //   {'Spikeball': 'Team_Sports'},
  //   {'Dodgeball': 'Team_Sports'},
  //   {'Softball': 'Team_Sports'},
  //   {'Voleyball': 'Physical_Sports'},
  //   {'Archery': 'Physical_Sports'},
  //   {'Bmx': 'Physical_Sports'},
  //   {'Bowling': 'Physical_Sports'},
  //   {'Croquet': 'Physical_Sports'},
  //   {'Cycling_Outdoor': 'Physical_Sports'},
  //   {'Dancing': 'Physical_Sports'},
  //   {'Dart': 'Physical_Sports'},
  //   {'Free_Running': 'Physical_Sports'},
  //   {'Frisbeeing': 'Physical_Sports'},
  //   {'Golf': 'Physical_Sports'},
  //   {'Gymnastic': 'Physical_Sports'},
  //   {'Horsing': 'Physical_Sports'},
  //   {'Riding_Hoverboard': 'Physical_Sports'},
  //   {'Jogging_Outdoor': 'Physical_Sports'},
  //   {'Polo': 'Physical_Sports'},
  //   {'Riding_Electric_Scooter': 'Physical_Sports'},
  //   {'Riding_Motorbike': 'Physical_Sports'},
  //   {'Riding_Scooter': 'Physical_Sports'},
  //   {'Rollerblade': 'Physical_Sports'},
  //   {'Rollerskate': 'Physical_Sports'},
  //   {'Running_Outdoor': 'Physical_Sports'},
  //   {'Skateboarding': 'Physical_Sports'},
  //   {'Streching': 'Physical_Sports'},
  //   {'Table_Soccer': 'Physical_Sports'},
  //   {'Table_Tennis': 'Physical_Sports'},
  //   {'Tennis': 'Physical_Sports'},
  //   {'Trekking': 'Physical_Sports'},
  //   {'Trampolining': 'Physical_Sports'},
  //   {'Yoga': 'Physical_Sports'},
  //   {'Padel': 'Physical_Sports'},
  //   {'Abseiling': 'Extreme_Sports'},
  //   {'Ballooning': 'Extreme_Sports'},
  //   {'Bungee_Jumping': 'Extreme_Sports'},
  //   {'Canyoning': 'Extreme_Sports'},
  //   {'Climbing': 'Extreme_Sports'},
  //   {'Hang_Gliding': 'Extreme_Sports'},
  //   {'Parachuting': 'Extreme_Sports'},
  //   {'Paragliding': 'Extreme_Sports'},
  //   {'Skydiving': 'Extreme_Sports'},
  //   {'Windsuit_Flying': 'Extreme_Sports'},
  //   {'Aikido': 'Combat_Sports'},
  //   {'Box': 'Combat_Sports'},
  //   {'Capoeira': 'Combat_Sports'},
  //   {'Free_Fighting': 'Combat_Sports'},
  //   {'Judo': 'Combat_Sports'},
  //   {'Jujitsu': 'Combat_Sports'},
  //   {'Karate': 'Combat_Sports'},
  //   {'Kickboxing': 'Combat_Sports'},
  //   {'Kung_Fu': 'Combat_Sports'},
  //   {'Mixed_Martial_Arts': 'Combat_Sports'},
  //   {'Muay_Thai': 'Combat_Sports'},
  //   {'Taekwondo': 'Combat_Sports'},
  //   {'Wrestling': 'Combat_Sports'},
  //   {'Backgammon': 'Board_Games'},
  //   {'Billard': 'Board_Games'},
  //   {'Checkers': 'Board_Games'},
  //   {'Chess': 'Board_Games'},
  //   {'Draughts': 'Board_Games'},
  //   {'Go': 'Board_Games'},
  //   {'Jenga': 'Board_Games'},
  //   {'Othello': 'Board_Games'},
  //   {'Field_Hockey': 'Team_Sports'},
  // ];

  List<String> get activityDefinedDate => _activityDefinedDate;
  List<String> get displayedActivity => _displayedActivity;
  List<String> get activityTitle => _activityTitle;
  List<String> get activityTypeDetail => _activityTypeDetail;
  List<String> get processDetailName => _processDetailName;
  List<String> get coachingType => _coachingType;
  List<String> get basicMembershipTypeValue => _basicMembershipTypeValue;
  List<String> get platinumMembershipTypeValue => _platinumMembershipTypeValue;
  List<String> get basicCoachingTypeValue => _basicCoachingTypeValue;
  List<String> get platinumCoachingTypeValue => _platinumCoachingTypeValue;
  List<Icon> get typeIcon => _typeIcon;
  List<Color> get typeColor => _typeColor;
  List<String> get typeSummaryDescription => _typeSummaryDescription;
  List<Icon> get coachingTypeIcon => _coachingTypeIcon;
  List<Color> get coachingTypeColor => _coachingTypeColor;
  List<String> get coachingTypeSummaryDescription =>
      _coachingTypeSummaryDescription;

  List<Map<String, dynamic>> get activityDefinedDateList =>
      _activityDefinedDateList;
  List<String> get dayDefinition => _dayDefinition;
  // List<Map<String, dynamic>> get activityTitleTypeMap => _activityTitleTypeMap;
}

class AppIconConstants extends AppConstants {
  static final List<Icon> _coachingTypeIcons = [
    const Icon(null),
    Icon(Icons.star_outline_rounded, size: 14, color: AppColors().secondary),
    Icon(Icons.stars_outlined, size: 14, color: AppColors().secondary),
    // Icon(Icons.stars_rounded, size: 14, color: AppColors().onSecondary),
  ];
  List<Icon> get coachingTypeIcons => _coachingTypeIcons;
}

class AppVisualConstants extends AppConstants {
  static const BorderRadius _borderRadiusBigCircular =
      BorderRadius.all(Radius.circular(30.0));
  static const BorderRadius _borderRadiusCircular =
      BorderRadius.all(Radius.circular(20.0));
  static const BorderRadius _borderRadiusSmallCircular =
      BorderRadius.all(Radius.circular(10.0));
  static const BorderRadius _borderRadiusCircularLeft = BorderRadius.only(
      topLeft: Radius.circular(20), bottomLeft: Radius.circular(20));
  static const BorderRadius _borderRadiusCircularRight = BorderRadius.only(
      topRight: Radius.circular(20), bottomRight: Radius.circular(20));
  static const BorderRadius _borderRadiusCircularTop = BorderRadius.only(
      topLeft: Radius.circular(10), topRight: Radius.circular(10));
  static const BorderRadius _borderRadiusCircularBottom = BorderRadius.only(
      bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10));
  static const BorderRadius _messageBorderRadiusOfAppUser = BorderRadius.only(
      topLeft: Radius.circular(15),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15));
  static const BorderRadius _messageBorderRadiusOfOther = BorderRadius.only(
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15));

  static const EdgeInsetsGeometry _verticalMargin =
      EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsetsGeometry _horizontalMargin =
      EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsetsGeometry _rightMarginInGeneral =
      EdgeInsets.only(right: 18);
  static const EdgeInsetsGeometry _horizontalAppMargin =
      EdgeInsets.only(left: 18, right: 18);
  static const EdgeInsetsGeometry _messageBoxMargin =
      EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  static const EdgeInsetsGeometry _miniPadding = EdgeInsets.all(5);
  static const EdgeInsetsGeometry _miniPaddingOnlyLeft =
      EdgeInsets.only(left: 5);
  static const EdgeInsetsGeometry _messageBoxPadding = EdgeInsets.all(10);
  static const EdgeInsetsGeometry _messageContentBoxPadding =
      EdgeInsets.all(10);
  static const EdgeInsetsGeometry _messageTextFieldPadding = EdgeInsets.all(5);
  static const EdgeInsetsGeometry _messageAttendeeUserCardPadding =
      EdgeInsets.only(left: 10);

  static const EdgeInsetsGeometry _messageSendingIconMargin =
      EdgeInsets.only(right: 5);
  static const EdgeInsetsGeometry _dropDownBoxPadding =
      EdgeInsets.symmetric(horizontal: 10, vertical: 6);
  static const EdgeInsetsGeometry _userCardLisTopPadding =
      EdgeInsets.only(top: 18);

  BorderRadius get borderRadiusBigCircular => _borderRadiusBigCircular;
  BorderRadius get borderRadiusCircular => _borderRadiusCircular;
  BorderRadius get borderRadiusSmallCircular => _borderRadiusSmallCircular;
  BorderRadius get borderRadiusCircularLeft => _borderRadiusCircularLeft;
  BorderRadius get borderRadiusCircularRight => _borderRadiusCircularRight;
  BorderRadius get borderRadiusCircularTop => _borderRadiusCircularTop;
  BorderRadius get borderRadiusCircularBottom => _borderRadiusCircularBottom;
  BorderRadius get messageBorderRadiusOfAppUser =>
      _messageBorderRadiusOfAppUser;
  BorderRadius get messageBorderRadiusOfOther => _messageBorderRadiusOfOther;

  EdgeInsetsGeometry get verticalMargin => _verticalMargin;
  EdgeInsetsGeometry get horizontalMargin => _horizontalMargin;
  EdgeInsetsGeometry get rightMarginInGeneral => _rightMarginInGeneral;
  EdgeInsetsGeometry get horizontalAppMargin => _horizontalAppMargin;
  EdgeInsetsGeometry get messageBoxMargin => _messageBoxMargin;
  EdgeInsetsGeometry get miniPadding => _miniPadding;
  EdgeInsetsGeometry get miniPaddingOnlyLeft => _miniPaddingOnlyLeft;
  EdgeInsetsGeometry get messageBoxPadding => _messageBoxPadding;
  EdgeInsetsGeometry get messageContentBoxPadding => _messageContentBoxPadding;
  EdgeInsetsGeometry get messageTextFieldPadding => _messageTextFieldPadding;
  EdgeInsetsGeometry get messageAttendeeUserCardPadding =>
      _messageAttendeeUserCardPadding;
  EdgeInsetsGeometry get messageSendingIconMargin => _messageSendingIconMargin;
  EdgeInsetsGeometry get dropDownBoxPadding => _dropDownBoxPadding;
  EdgeInsetsGeometry get userCardLisTopPadding => _userCardLisTopPadding;
}

class AppTextConstants extends AppConstants {
  static const String _attendAnActivity = 'Attend...';
  static const String _createAnActivity = 'Create...';
  static const String _showTheResults = 'Show the results';
  // static const String _heroCardImage = 'CardImage';
  // static const String _heroCardUsername = 'CardUsername';
  static const String _createTheActivity = 'Create the activity';
  static const String _findACoach = 'Find a coach';
  static const String _findATrainee = 'Find a trainee';
  static const String _accept = 'Accept';
  static const String _decline = 'Decline';
  static const String _request = 'Request';
  static const String _offer = 'Offer';
  static const String _cancel = 'Cancel';
  static const String _update = 'Update';
  static const String _add = 'Add';
  static const String _approve = 'Approve';
  static const String _deny = 'Deny';
  static const String _startConversation = 'Start conversation';
  static const String _denyRequest = 'Deny request';
  static const String _save = 'Save';

  String get attendAnActivity => _attendAnActivity;
  String get createAnActivity => _createAnActivity;
  String get showTheResults => _showTheResults;
  // String get heroCardImage => _heroCardImage;
  // String get heroCardUsername => _heroCardUsername;
  String get createTheActivity => _createTheActivity;
  String get findACoach => _findACoach;
  String get findATrainee => _findATrainee;
  String get accept => _accept;
  String get decline => _decline;
  String get request => _request;
  String get offer => _offer;
  String get cancel => _cancel;
  String get update => _update;
  String get add => _add;
  String get approve => _approve;
  String get deny => _deny;
  String get startConversation => _startConversation;
  String get denyRequest => _denyRequest;
  String get save => _save;
}

class AppFeedbacks extends AppConstants {
  static const String _feedbackAboutMissingActivityBeginningDate =
      'Please select beginning date from Activity Date Range';
  static const String _feedbackAboutMissingActivityEndingDate =
      'Please select ending date from Activity Date Range';
  static const String _feedbackAboutMissingActivityTypeChoice =
      'Please choose at least one of Activity Type option';
  static const String _feedbackAboutMissingActivityNameChoice =
      'Please choose at least one of Activity Name option';
  static const String _feedbackAboutMissingOneActivityTypeChoice =
      'Please choose one of Activity Type option';
  static const String _feedbackAboutMissingOneActivityNameChoice =
      'Please choose one of Activity Name option';
  static const String _feedbackAboutEmptyTemplateName =
      'Template name cannot be empty';
  static const String _feedbackAboutEmptyLatitudeLongitude =
      'Latitude,Longitude cannot be empty';
  static const String _feedbackAboutEmptyNameSurname =
      'Name Surname cannot be empty';
  static const String _feedbackAboutEmptyUsername = 'Username cannot be empty';
  static const String _feedbackAboutEmptyBirthyear =
      'Birthyear cannot be empty';
  static const String _feedbackAboutMissingOneGenderChoice =
      'Gender cannot be empty';
  static const String _feedbackAboutEmptyEmail = 'Email cannot be empty';
  static const String _feedbackAboutEmptyAddress = 'Address cannot be empty';
  static const String _feedbackAboutMissingOneCityChoice =
      'City cannot be empty';
  static const String _feedbackAboutMissingOneCountryChoice =
      'Country cannot be empty';
  static const String _feedbackAboutEmptyAboutYourself =
      'About yourself cannot be empty';
  static const String _feedbackAboutEmptyExperienceYear =
      'Experience year cannot be empty';
  static const String _feedbackAboutEmptyMinLesson =
      'Min lesson cannot be empty';
  static const String _feedbackAboutEmptyPerLessonPrice =
      'Per lesson price cannot be empty';

  String get feedbackAboutMissingActivityBeginningDate =>
      _feedbackAboutMissingActivityBeginningDate;
  String get feedbackAboutMissingActivityEndingDate =>
      _feedbackAboutMissingActivityEndingDate;
  String get feedbackAboutMissingActivityTypeChoice =>
      _feedbackAboutMissingActivityTypeChoice;
  String get feedbackAboutMissingActivityNameChoice =>
      _feedbackAboutMissingActivityNameChoice;
  String get feedbackAboutMissingOneActivityTypeChoice =>
      _feedbackAboutMissingOneActivityTypeChoice;
  String get feedbackAboutMissingOneActivityNameChoice =>
      _feedbackAboutMissingOneActivityNameChoice;
  String get feedbackAboutEmptyTemplateName => _feedbackAboutEmptyTemplateName;
  String get feedbackAboutEmptyLatitudeLongitude =>
      _feedbackAboutEmptyLatitudeLongitude;
  String get feedbackAboutEmptyNameSurname => _feedbackAboutEmptyNameSurname;
  String get feedbackAboutEmptyUsername => _feedbackAboutEmptyUsername;
  String get feedbackAboutEmptyBirthyear => _feedbackAboutEmptyBirthyear;
  String get feedbackAboutMissingOneGenderChoice =>
      _feedbackAboutMissingOneGenderChoice;
  String get feedbackAboutEmptyEmail => _feedbackAboutEmptyEmail;
  String get feedbackAboutEmptyAddress => _feedbackAboutEmptyAddress;
  String get feedbackAboutMissingOneCityChoice =>
      _feedbackAboutMissingOneCityChoice;
  String get feedbackAboutMissingOneCountryChoice =>
      _feedbackAboutMissingOneCountryChoice;
  String get feedbackAboutEmptyAboutYourself =>
      _feedbackAboutEmptyAboutYourself;
  String get feedbackAboutEmptyExperienceYear =>
      _feedbackAboutEmptyExperienceYear;
  String get feedbackAboutEmptyMinLesson => _feedbackAboutEmptyMinLesson;
  String get feedbackAboutEmptyPerLessonPrice =>
      _feedbackAboutEmptyPerLessonPrice;
}

class AppBorderRadiusConstants extends AppConstants {
  AppBorderRadiusConstants._();

  static const r8 = BorderRadius.all(Radius.circular(10.0));
}

class AppBorderSideConstants extends AppConstants {
  AppBorderSideConstants._();
  static const border =
      BorderSide(color: AppColorPalettes.blueLight, width: 1.5);
  static const enabled =
      BorderSide(color: AppColorPalettes.strokeGrey, width: 1.5);
  static const error = BorderSide(color: AppColorPalettes.red, width: 1.5);
  static const success =
      BorderSide(color: AppColorPalettes.greenDark, width: 1.5);
}

class AppOutlineInputBorder extends AppConstants {
  AppOutlineInputBorder._();
  static const border = OutlineInputBorder(
      borderRadius: AppBorderRadiusConstants.r8,
      borderSide: AppBorderSideConstants.border);
  static const enabled = OutlineInputBorder(
      borderRadius: AppBorderRadiusConstants.r8,
      borderSide: AppBorderSideConstants.enabled);
  static const error = OutlineInputBorder(
      borderRadius: AppBorderRadiusConstants.r8,
      borderSide: AppBorderSideConstants.error);
  static const success = OutlineInputBorder(
      borderRadius: AppBorderRadiusConstants.r8,
      borderSide: AppBorderSideConstants.success);
}

class AppNumberConstants extends AppConstants {
  static const int _queryLimit = 12;
  static const int _processRequest = 1;
  static const int _processApproved = 2;
  static const int _processDenied = 3;
  static const int _ageBorder = 30;

  static const int _appUserId = 21810;
  static const int _appCoachId = 190;

  // static const int _appUserId = 1725;
  // static const int _appCoachId = 0;

  // static const int _appUserId =
  //     5500; // For ExistencePage_CreationTab (5. activity for most attendees) & ExistencePage_TemplateTab
  // static const int _appCoachId = 0;

  // static const int _appUserId = 11456; // For ExistencePage_AttendanceTab (5. activity for most attendees)
  // static const int _appCoachId = 0;

  /// This user is for messages screen_activity_conversation because he is one  of having the highest number of messages. And he is not a coach so appCoachId is 0
  // static const int _appUserId = 13243;
  // static const int _appCoachId = 0;

  /// For MessageScreen_TrainingOffer
  /// static const int _appUserId = 21810;
  /// static const int _appCoachId = 190;

  /// For MessageScreen_TrainingRequest
  /// static const int _appUserId = 10639;
  // static const int _appUserId = 13856;
  // static const int _appCoachId = 0;

  // static const int _appUserId = 13243;
  // static const int _appUserId = 2553; /// This user is a coach as well and his coach id is: 13
  // static const int _appCoachId = 13;  /// This coach is a user as well and his user id is: 2553
  static const double _cardInformationHeight = 98;

  static const double _locationCircularDiamter = 51;
  static const double _skeltonHeight3 = 24;
  static const double _skeltonHeight6 = 18;

  // for Widgets
  static const double _kMainHeight = 18.0;
  static const double _kMainHeightHalf = 9.0;
  static const double _kMainWrapSpacing = 18.0;

  // for lenght limit
  static const int _kTemplateNameLenghtLimit = 31;
  static const int _kMainWordLenghtLimit = 61;
  static const int _kUsernameLenghtLimit = 101;
  static const int _kBirthyearDigitLimit = 4;
  static const int _kEmailLenghtLimit = 76;
  static const int _kAddressLenghtLimit = 101;
  static const int _kAboutYourselfLenghtLimit = 250;
  static const int _kMinLessonDigitLimit = 1;
  static const int _kPerLessonPriceMaxDigitLimit = 5;

  // for dialog radio of screen
  static const double _kActivityTemplateAddingDialogRatio = 0.75;
  static const double _kActivityTemplateUpdatingDialogRatio = 0.75;

  static const double _kLocationTemplateAddingDialogRatio = 0.45;
  static const double _kLocationTemplateUpdatingDialogRatio = 0.45;

  static const double _kTrainingRequestAddingDialogRatio = 0.82;
  static const double _kTrainingOfferAddingDialogRatio = 0.82;

  static const double _kPersonalDetailsEditingDialogRatio = 0.82;
  static const double _kCoachingDetailsEditingDialogRatio = 0.55;

  static const double _kTemplateNameDialogRatio = 0.40;
  static const double _kNameSurnameDialogRatio = 0.30;
  static const double _kUsernameDialogRatio = 0.30;
  static const double _kBirthyearDialogRatio = 0.25;
  static const double _kGenderDialogRatio = 0.25;
  static const double _kEmailDialogRatio = 0.30;
  static const double _kCityDialogRatio = 0.25;
  static const double _kCountryDialogRatio = 0.25;
  static const double _kCityCountryDialogRatio = 0.35;
  static const double _kAddressDialogRatio = 0.25;
  static const double _kAboutYourselfDialogRatio = 0.45;
  static const double _kExperienceYearDialogRatio = 0.25;
  static const double _kMinLessonDialogRatio = 0.25;
  static const double _kPerLessonPriceDialogRatio = 0.25;

  int get queryLimit => _queryLimit;
  int get processRequest => _processRequest;
  int get processApproved => _processApproved;
  int get processDenied => _processDenied;

  int get appUserId => _appUserId;
  int get appCoachId => _appCoachId;
  int get ageBorder => _ageBorder;

  double get cardInformationHeight => _cardInformationHeight;

  double get locationCircularDiamter => _locationCircularDiamter;
  double get skeltonHeight3 => _skeltonHeight3;
  double get skeltonHeight6 => _skeltonHeight6;
  double get kMainHeight => _kMainHeight;
  double get kMainHeightHalf => _kMainHeightHalf;
  double get kMainWrapSpacing => _kMainWrapSpacing;

  int get kTemplateNameLenghtLimit => _kTemplateNameLenghtLimit;
  int get kMainWordLenghtLimit => _kMainWordLenghtLimit;
  int get kUsernameLenghtLimit => _kUsernameLenghtLimit;
  int get kBirthyearDigitLimit => _kBirthyearDigitLimit;
  int get kEmailLenghtLimit => _kEmailLenghtLimit;
  int get kAddressLenghtLimit => _kAddressLenghtLimit;
  int get kAboutYourselfLenghtLimit => _kAboutYourselfLenghtLimit;
  int get kMinLessonDigitLimit => _kMinLessonDigitLimit;
  int get kPerLessonPriceMaxDigitLimit => _kPerLessonPriceMaxDigitLimit;

  double get kActivityTemplateAddingDialogRatio =>
      _kActivityTemplateAddingDialogRatio;
  double get kActivityTemplateUpdatingDialogRatio =>
      _kActivityTemplateUpdatingDialogRatio;

  double get kLocationTemplateAddingDialogRatio =>
      _kLocationTemplateAddingDialogRatio;
  double get kLocationTemplateUpdatingDialogRatio =>
      _kLocationTemplateUpdatingDialogRatio;

  double get kTrainingRequestAddingDialogRatio =>
      _kTrainingRequestAddingDialogRatio;
  double get kTrainingOfferAddingDialogRatio =>
      _kTrainingOfferAddingDialogRatio;

  double get kPersonalDetailsEditingDialogRatio =>
      _kPersonalDetailsEditingDialogRatio;
  double get kCoachingDetailsEditingDialogRatio =>
      _kCoachingDetailsEditingDialogRatio;

  double get kTemplateNameDialogRatio => _kTemplateNameDialogRatio;
  double get kNameSurnameDialogRatio => _kNameSurnameDialogRatio;
  double get kUsernameDialogRatio => _kUsernameDialogRatio;
  double get kBirthyearDialogRatio => _kBirthyearDialogRatio;
  double get kGenderDialogRatio => _kGenderDialogRatio;
  double get kEmailDialogRatio => _kEmailDialogRatio;
  double get kCityDialogRatio => _kCityDialogRatio;
  double get kCountryDialogRatio => _kCountryDialogRatio;
  double get kCityCountryDialogRatio => _kCityCountryDialogRatio;
  double get kAddressDialogRatio => _kAddressDialogRatio;
  double get kAboutYourselfDialogRatio => _kAboutYourselfDialogRatio;
  double get kExperienceYearDialogRatio => _kExperienceYearDialogRatio;
  double get kMinLessonDialogRatio => _kMinLessonDialogRatio;
  double get kPerLessonPriceDialogRatio => _kPerLessonPriceDialogRatio;
}

class AppColorPalettes extends AppConstants {
  AppColorPalettes._();

  static const blueLight = Color(0xFF5599FB);
  static const greenDark = Color(0xFF219653);
  static const red = Color(0xFFFF0033);
  static const strokeGrey = Color(0xFFB4B4B4);
}

class AppInformationConstants extends AppConstants {
  static const String _kAboutActivityTemplateLimit =
      'You have reached your limit for adding activity template. In order to add more activities, please update your membership type';
  static const String _kAboutLocationTemplateLimit =
      'You have reached your limit for adding location template. In order to add more locations, please update your membership type';
  static const String _kAboutActivityCreatingLimit =
      'You have reached your limit for chosing activity. In order to add more activities, please update your membership type';
  static const String _kAboutActivityPreferencesLimit =
      'You have reached your limit for activity creating. In order to create more activities, please update your membership type';
  static const String _kAboutActivityAttendingLimit =
      'You have reached your limit for activity attending. In order to attend more activities, please update your membership type';
  static const String _kAboutFindACoachLimit =
      'You have reached your limit for finding a coach on this activity. In order to find more coaches for this activity, please update your membership type';
  static const String _kAboutFindATraineeLimit =
      'You have reached your limit for finding a trainee on this activity. In order to find more trainees for this activity, please update your coaching type';

  String get kAboutActivityTemplateLimit => _kAboutActivityTemplateLimit;
  String get kAboutLocationTemplateLimit => _kAboutLocationTemplateLimit;
  String get kAboutActivityCreatingLimit => _kAboutActivityCreatingLimit;
  String get kAboutActivityPreferencesLimit => _kAboutActivityPreferencesLimit;
  String get kAboutActivityAttendingLimit => _kAboutActivityAttendingLimit;
  String get kAboutFindACoachLimit => _kAboutFindACoachLimit;
  String get kAboutFindATraineeLimit => _kAboutFindATraineeLimit;
}

class AppIconMapConstants extends AppConstants {
  static final Map<String, Icon> _activityIcon = {
    'Abseiling': const Icon(Icons.shop_sharp),
    'Aikido': const Icon(
      Icons.developer_board_outlined,
    ),
    'Alpine_Skiing': const Icon(Icons.minor_crash_sharp),
    'American_Football': const Icon(
      Icons.roller_shades_outlined,
    ),
    'Archery': const Icon(
      Icons.screen_lock_rotation_sharp,
    ),
    'Backgammon': const Icon(
      Icons.local_attraction_rounded,
    ),
    'Badminton': const Icon(Icons.sports_soccer_rounded),
    'Ballooning': const Icon(Icons.assistant),
    'Baseball': const Icon(Icons.ten_k_sharp),
    'Basketball': const Icon(
      Icons.airplanemode_on_rounded,
    ),
    'Biathlon': const Icon(Icons.dining_rounded),
    'Billard': const Icon(
      Icons.person_search_outlined,
    ),
    'Bmx': const Icon(
      Icons.photo_camera_front_outlined,
    ),
    'Bobsleigh': const Icon(Icons.pregnant_woman),
    'Boccia': const Icon(Icons.temple_hindu_outlined),
    'Bowling': const Icon(
      Icons.dnd_forwardslash_outlined,
    ),
    'Box': const Icon(Icons.fourteen_mp_outlined),
    'Bungee_Jumping': const Icon(Icons.leak_remove_outlined),
    'Calisthenics': const Icon(Icons.cabin),
    'Canoeing': const Icon(Icons.token_outlined),
    'Canyoning': const Icon(
      Icons.sentiment_dissatisfied_outlined,
    ),
    'Capoeira': const Icon(Icons.redeem_sharp),
    'Cardio': const Icon(Icons.sports_score_rounded),
    'Checkers': const Icon(Icons.smart_toy_rounded),
    'Chess': const Icon(Icons.hls_outlined),
    'Climbing': const Icon(Icons.mode_night),
    'Cricket': const Icon(Icons.add_reaction_sharp),
    'Croquet': const Icon(Icons.subtitles),
    'Cross_Country_Ski': const Icon(
      Icons.subdirectory_arrow_right_outlined,
    ),
    'Crossfit': const Icon(Icons.approval_outlined),
    'Curling': const Icon(
      Icons.notifications_paused_outlined,
    ),
    'Cycling_in_Gym': const Icon(Icons.mosque_rounded),
    'Cycling_Outdoor': const Icon(Icons.open_in_new_sharp),
    'Dancing': const Icon(Icons.vertical_split),
    'Dart': const Icon(Icons.sd_sharp),
    'Dodgeball': const Icon(Icons.podcasts_sharp),
    'Draughts': const Icon(Icons.close_rounded),
    'Field_Hockey': const Icon(Icons.qr_code_sharp),
    'Figure_Skating': const Icon(Icons.add_home_work),
    'Fishing': const Icon(Icons.featured_play_list),
    'Flag_football': const Icon(
      Icons.move_to_inbox_outlined,
    ),
    'Floor_Hockey': const Icon(Icons.eight_k_plus_outlined),
    'Flyboarding': const Icon(Icons.add_to_queue_rounded),
    'Foilsurfing': const Icon(Icons.block_sharp),
    'Football': const Icon(Icons.smartphone_sharp),
    'Free_Fighting': const Icon(Icons.emoji_events),
    'Free_Running': const Icon(Icons.minimize),
    'Freediving': const Icon(Icons.battery_6_bar),
    'Frisbeeing': const Icon(
      Icons.settings_display_outlined,
    ),
    'Futsal': const Icon(
      Icons.settings_input_composite_sharp,
    ),
    'Go': const Icon(Icons.directions_bike),
    'Golf': const Icon(Icons.aspect_ratio),
    'Gymnastic': const Icon(Icons.wrong_location),
    'Handball': const Icon(Icons.sim_card_sharp),
    'Hang_Gliding': const Icon(
      Icons.markunread_mailbox_outlined,
    ),
    'Hiit': const Icon(Icons.loyalty_sharp),
    'Hockey': const Icon(Icons.wifi_2_bar),
    'Horsing': const Icon(
      Icons.keyboard_double_arrow_down_outlined,
    ),
    'Ice_Skating': const Icon(Icons.linked_camera),
    'Jenga': const Icon(
      Icons.rounded_corner_outlined,
    ),
    'Jet_Surfing': const Icon(Icons.party_mode_rounded),
    'Jogging_in_Gym': const Icon(Icons.label_outlined),
    'Jogging_Outdoor': const Icon(Icons.star_outline_outlined),
    'Judo': const Icon(Icons.house_rounded),
    'Jujitsu': const Icon(
      Icons.fitness_center_rounded,
    ),
    'Karate': const Icon(Icons.directions_train),
    'Kayaking': const Icon(
      Icons.keyboard_arrow_left_rounded,
    ),
    'Kickboxing': const Icon(Icons.houseboat),
    'Kitesurfing': const Icon(Icons.bug_report_sharp),
    'Kung_Fu': const Icon(Icons.perm_media_sharp),
    'Lawn_Bowls': const Icon(Icons.fit_screen_outlined),
    'Luge': const Icon(
      Icons.open_in_browser_outlined,
    ),
    'Mixed_Martial_Arts': const Icon(Icons.contact_mail_sharp),
    'Muay_Thai': const Icon(Icons.kebab_dining_rounded),
    'Othello': const Icon(Icons.balcony_outlined),
    'Padel': const Icon(Icons.graphic_eq_sharp),
    'Parachuting': const Icon(Icons.egg_outlined),
    'Paragliding': const Icon(Icons.portrait_outlined),
    'Polo': const Icon(Icons.brightness_2_outlined),
    'Powerlifting': const Icon(
      Icons.earbuds_battery_outlined,
    ),
    'Quidditch': const Icon(Icons.one_k_plus_rounded),
    'Rafting': const Icon(Icons.content_copy),
    'Riding_Electric_Scooter': const Icon(Icons.cancel_rounded),
    'Riding_Hoverboard': const Icon(Icons.save_alt_sharp),
    'Riding_Motorbike': const Icon(
      Icons.electrical_services_outlined,
    ),
    'Riding_Scooter': const Icon(Icons.table_chart_rounded),
    'Rollerblade': const Icon(
      Icons.indeterminate_check_box_sharp,
    ),
    'Rollerskate': const Icon(Icons.sync_alt_rounded),
    'Rowing': const Icon(Icons.church),
    'Rugby': const Icon(Icons.swipe_right_alt),
    'Running_in_Gym': const Icon(
      Icons.safety_divider_rounded,
    ),
    'Running_Outdoor': const Icon(Icons.send_time_extension),
    'Sailing': const Icon(Icons.work_off),
    'Skateboarding': const Icon(Icons.alarm_on_rounded),
    'Skeleton': const Icon(
      Icons.money_off_csred_outlined,
    ),
    'Skiing': const Icon(Icons.window_sharp),
    'Skuba_Diving': const Icon(
      Icons.bluetooth_disabled_sharp,
    ),
    'Skydiving': const Icon(Icons.send_rounded),
    'Sledging': const Icon(Icons.assistant_photo_sharp),
    'Snorkeling': const Icon(Icons.six_k_outlined),
    'Snowboarding': const Icon(
      Icons.not_accessible_outlined,
    ),
    'Softball': const Icon(Icons.screen_search_desktop),
    'Speed_Skating': const Icon(Icons.sort),
    'Spikeball': const Icon(Icons.nat_rounded),
    'Stand_Up_Paddleboarding': const Icon(Icons.newspaper),
    'Streching': const Icon(Icons.balance_sharp),
    'Surfing': const Icon(
      Icons.electric_rickshaw_rounded,
    ),
    'Swimming': const Icon(
      Icons.surround_sound_outlined,
    ),
    'Table_Soccer': const Icon(Icons.two_mp_outlined),
    'Table_Tennis': const Icon(Icons.video_library_rounded),
    'Taekwondo': const Icon(Icons.card_travel_outlined),
    'Tennis': const Icon(
      Icons.browser_not_supported_rounded,
    ),
    'Trampolining': const Icon(Icons.pin_drop_outlined),
    'Trekking': const Icon(
      Icons.photo_size_select_actual_rounded,
    ),
    'Voleyball': const Icon(Icons.phonelink_ring),
    'Wakeboarding': const Icon(Icons.outlined_flag_sharp),
    'Walking_in_Gym': const Icon(Icons.drafts_rounded),
    'Water_Skiing': const Icon(
      Icons.security_update_good_sharp,
    ),
    'Windsuit_Flying': const Icon(
      Icons.thumbs_up_down_outlined,
    ),
    'Windsurfing': const Icon(Icons.soup_kitchen_rounded),
    'Workout_in_Gym': const Icon(Icons.fast_forward_sharp),
    'Workout_Outdoor': const Icon(Icons.shopping_bag_outlined),
    'Wrestling': const Icon(Icons.insights_rounded),
    'Yatching': const Icon(Icons.rocket_launch),
    'Yoga': const Icon(Icons.outbound),
  };

  Map<String, Icon> get activityIcon => _activityIcon;
}

class AppTextStyleConstants extends AppConstants {
  // For Tabs ----------------------------------------------------------------------------------------------------------
  static const TextStyle _tabTextStyle = TextStyle(fontSize: 14);
  TextStyle get tabTextStyle => _tabTextStyle;

  // For Alert Dialogs -------------------------------------------------------------------------------------------------
  static const TextStyle _titleTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const TextStyle _contentTextStyle = TextStyle(fontSize: 14);
  static const TextStyle _actionTextStyle = TextStyle(fontSize: 14);

  TextStyle get titleTextStyle => _titleTextStyle;
  TextStyle get contentTextStyle => _contentTextStyle;
  TextStyle get actionTextStyle => _actionTextStyle;
}
