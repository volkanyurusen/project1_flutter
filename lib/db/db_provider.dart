import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_project/base/database_base.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/models/models_reading/xmodels_reading.dart';

class DbProvider implements DatabaseBase {
  final AppFunctions _appFunctions = AppFunctions();
  final int queryLimit = AppNumberConstants().queryLimit;
  final int offsetNumber = 0;

  /// ACTIVITY CONVERSATION DYNAMIC BY USER ==========================================================================
  @override
  Future<List<ActivityConversationDynamic>>
      getActivityConversationDynamicDataByUser(int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityConversationDynamicByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityConversationDynamicList = json
            .map((activityConversationDynamic) =>
                ActivityConversationDynamic.fromJson(
                    activityConversationDynamic))
            .toList();
        return activityConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getActivityConversationDynamicDataByUser');
  }

  /// ACTIVITY MESSAGE DYNAMIC BY USER =================================================================================
  @override
  Future<List<MessageDynamic>> getActivityMessageDynamicDataByUser(
      int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityMessageDynamicByUserEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityMessageDynamicList = json
            .map((activityMessageDynamic) =>
                MessageDynamic.fromJson(activityMessageDynamic))
            .toList();
        return activityMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getActivityMessageDynamicDataByUser');
  }

  /// MESSAGE DYNAMIC BY GROUP OF ACTIVITY CONVERSATION ================================================================
  @override
  Future<List<MessageDynamic>>
      getMessageDynamicDataByGroupOfActivityConversation(
          int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.messageDynamicByGroupOfActivityConversationEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final messageDynamicList = json
            .map((messageDynamic) => MessageDynamic.fromJson(messageDynamic))
            .toList();
        return messageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getMessageDynamicDataByGroupOfActivityConversation');
  }

  /// TRAINING OFFER MESSAGE DYNAMIC BY TRAINING OFFER CONVERSATION ================================================
  @override
  Future<List<MessageDynamic>> getMessageDynamicDataByActivityConversation(
      int createdActivityId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.messageDynamicByActivityConversationEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.createdActivityId +
        createdActivityId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final messageDynamicList = json
            .map((messageDynamic) => MessageDynamic.fromJson(messageDynamic))
            .toList();
        return messageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getMessageDynamicDataByActivityConversation');
  }

  /// ACTIVITY NAME DYNAMIC ===========================================================================================
  @override
  Future<List<ActivityNameDynamic>> getAllActivityNameDynamicData() async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.activityNameDynamicEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityNameDynamicList = json
            .map((activityNameDynamic) =>
                ActivityNameDynamic.fromJson(activityNameDynamic))
            .toList();
        return activityNameDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getAllActivityNameDynamicData');
  }

  /// ACTIVITY NAME DYNAMIC BY ACTIVITY TYPE DYNAMIC ===================================================================
  @override
  Future<List<ActivityNameDynamic>> getActivityNameDynamicDataByActivityType(
      List<String> activityTypeList) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityNameDynamicByActivityTypeEndPoint +
        _appFunctions.toStringForApiRequest(activityTypeList);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityNameDynamicList = json
            .map((activityNameDynamic) =>
                ActivityNameDynamic.fromJson(activityNameDynamic))
            .toList();
        return activityNameDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getActivityNameDynamicDataByActivityType');
  }

  /// ACTIVITY TEMPLATE DYNAMIC BY USER ================================================================================
  @override
  Future<List<ActivityTemplateDynamic>> getActivityTemplateDynamicDataByUser(
      int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityTemplateDynamicByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityTemplateDynamicList = json
            .map((activityTemplateDynamic) =>
                ActivityTemplateDynamic.fromJson(activityTemplateDynamic))
            .toList();
        //
        // print(activityTemplateDynamicList[0].templateName);
        // print(activityTemplateDynamicList.map((e) => e.templateName).toList());
        // print(activityTemplateDynamicList.length);
        return activityTemplateDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getActivityTemplateDynamicDataByUser');
  }

  /// ACTIVITY TYPE DYNAMIC ============================================================================================
  @override
  Future<List<ActivityTypeDynamic>> getAllActivityTypeDynamicData() async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.activityTypeDynamicEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityTypeDynamicList = json
            .map((activityTypeDynamic) =>
                ActivityTypeDynamic.fromJson(activityTypeDynamic))
            .toList();
        return activityTypeDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getAllActivityTypeDynamicData');
  }

  /// CITY DYNAMIC BY COUNTRY ========================================================================================
  @override
  Future<List<CityDynamic>> getCityDynamicDataByCountry(
      String countryDetail) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.cityDynamicByCountryEndPoint +
        ApiConstants.countryDetailEndPoint +
        countryDetail;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final cityDynamicList = json
            .map((cityDynamic) => CityDynamic.fromJson(cityDynamic))
            .toList();
        return cityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getCityDynamicDataByCountry');
  }

  /// COACH ==========================================================================================================
  @override
  Future<List<Coach>> getCoachData(int coachId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.coachEndPoint +
        ApiConstants.separatrix +
        coachId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        /// ? THIS CODE ADDED BECAUSE THe ONLY ONE ID REQUESTED AND IT NEEDS TO CONVERT TO LIST
        final json = [];
        json.add(jsonDecode(rawDataResponse.body));
        final coachList = json.map((coach) => Coach.fromJson(coach)).toList();
        return coachList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getCoachData');
  }

  /// COACH DYNAMIC ====================================================================================================
  @override
  Future<List<CoachDynamic>> getCoachDynamicData(int coachId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.coachDynamicEndPoint +
        ApiConstants.coachId +
        coachId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final coachDynamicList = json
            .map((coachDynamic) => CoachDynamic.fromJson(coachDynamic))
            .toList();
        return coachDynamicList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getCoachDynamicData');
  }

  /// COACH EXPERIENCE DYNAMIC =========================================================================================
  @override
  Future<List<CoachingExperienceDynamic>>
      getAllCoachingExperienceDynamicData() async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.coachingExperienceDynamicEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final coachingExperienceDynamicList = json
            .map((coachingExperienceDynamic) =>
                CoachingExperienceDynamic.fromJson(coachingExperienceDynamic))
            .toList();
        return coachingExperienceDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getAllCoachingExperienceDynamicData');
  }

  /// COACHING TYPE ====================================================================================================
  @override
  Future<List<CoachingType>> getAllCoachingTypeData() async {
    String uri = ApiConstants.baseUrl + ApiConstants.coachingTypeEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final coachingTypeList = json
            .map((coachingType) => CoachingType.fromJson(coachingType))
            .toList();
        return coachingTypeList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getAllCoachingTypeData');
  }

  /// CONSISTED ACTIVITY DYNAMIC WITH DISTANCE ATTENDED BY USER ========================================================
  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataAttendedByUser(
          int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .consistedActivityDynamicWithDistanceAttendedByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    //
    // print(uri);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    //print('rawDataResponse.body: ${rawDataResponse.body}');
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final consistedActivityDynamicWithDistanceList = json
            .map((consistedActivityDynamicWithDistance) =>
                ConsistedActivityDynamicWithDistance.fromJson(
                    consistedActivityDynamicWithDistance))
            .toList();
        //
        // print(
        //     'consistedActivityDynamicWithDistanceList: $consistedActivityDynamicWithDistanceList');
        return consistedActivityDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getConsistedActivityDynamicWithDistanceDataAttendedByUser');
  }

  /// CONSISTED ACTIVITY DYNAMIC WITH DISTANCE BY USER =================================================================
  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataByUser(int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.consistedActivityDynamicWithDistanceByUserEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final consistedActivityDynamicWithDistanceList = json
            .map((consistedActivityDynamicWithDistance) =>
                ConsistedActivityDynamicWithDistance.fromJson(
                    consistedActivityDynamicWithDistance))
            .toList();
        return consistedActivityDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getConsistedActivityDynamicWithDistanceDataByUser');
  }

  /// CONSISTED ACTIVITY DYNAMIC WITH DISTANCE CREATED BY USER =======================================================
  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataCreatedByUser(
          int createdActivityId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .consistedActivityDynamicWithDistanceByCreatedActivityEndPoint +
        ApiConstants.createdActivityId +
        createdActivityId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final consistedActivityDynamicWithDistanceList = json
            .map((consistedActivityDynamicWithDistance) =>
                ConsistedActivityDynamicWithDistance.fromJson(
                    consistedActivityDynamicWithDistance))
            .toList();
        return consistedActivityDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getConsistedActivityDynamicWithDistanceDataCreatedByUser');
  }

  /// COUNTRY CITY DYNAMIC =============================================================================================
  @override
  Future<List<CountryCityDynamic>> getCountryCityDynamicDataById(
      int countryCityId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.countryCityDynamicEndPoint +
        ApiConstants.countryCityId +
        countryCityId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final countryCityDynamicList = json
            .map((countryCityDynamic) =>
                CountryCityDynamic.fromJson(countryCityDynamic))
            .toList();
        return countryCityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getCountryCityDynamicData');
  }

  /// COUNTRY DYNAMIC ==================================================================================================
  @override
  Future<List<CountryDynamic>> getAllCountryDynamicData() async {
    String uri = ApiConstants.baseUrl + ApiConstants.countryDynamicEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final countryDynamicList = json
            .map((countryDynamic) => CountryDynamic.fromJson(countryDynamic))
            .toList();
        return countryDynamicList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getCountryDynamicData');
  }

  /// CREATED ACTIVITY DYNAMIC WITH DISTANCE ATTENDED BY USER ========================================================
  @override
  Future<List<CreatedActivityDynamicWithDistance>>
      getCreatedActivityDynamicWithDistanceDataCreatedByUser(
          int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.createdActivityDynamicWithDistanceCreatedByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    //
    // print(uri);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final createdActivityDynamicWithDistanceList = json
            .map((createdActivityDynamicWithDistance) =>
                CreatedActivityDynamicWithDistance.fromJson(
                    createdActivityDynamicWithDistance))
            .toList();
        //
        // print(
        //     'createdActivityDynamicWithDistanceList: ${createdActivityDynamicWithDistanceList}');
        return createdActivityDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getCreatedActivityDynamicWithDistanceDataCreatedByUser');
  }

  /// GENDER DYNAMIC ===================================================================================================
  @override
  Future<List<GenderDynamic>> getAllGenderDynamicData() async {
    String uri = ApiConstants.baseUrl + ApiConstants.genderDynamicEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final genderDynamicList = json
            .map((genderDynamic) => GenderDynamic.fromJson(genderDynamic))
            .toList();
        return genderDynamicList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getGenderDynamicData');
  }

  /// LOCATION TEMPLATE DYNAMIC BY USER ================================================================================
  @override
  Future<List<LocationTemplateDynamic>> getLocationTemplateDynamicDataByUser(
      int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.locationTemplateDynamicByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final locationTemplateDynamicList = json
            .map((locationTemplateDynamic) =>
                LocationTemplateDynamic.fromJson(locationTemplateDynamic))
            .toList();
        return locationTemplateDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getLocationTemplateDynamicDataByUser');
  }

  /// MEMBERSHIP TYPE ==================================================================================================
  @override
  Future<List<MembershipType>> getAllMembershipTypeData() async {
    String uri = ApiConstants.baseUrl + ApiConstants.membershipTypeEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final membershipTypeList = json
            .map((membershipType) => MembershipType.fromJson(membershipType))
            .toList();
        return membershipTypeList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getMembershipTypeData');
  }

  /// PROCESS DETAIL DYNAMIC =========================================================================================
  @override
  Future<List<ProcessDetailDynamic>> getAllProcessDetailDynamicData() async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.processDetailDynamicEndPoint;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final processDetailDynamicList = json
            .map((processDetailDynamic) =>
                ProcessDetailDynamic.fromJson(processDetailDynamic))
            .toList();
        return processDetailDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getAllProcessDetailDynamicData');
  }

  /// RECENT ACTIVITY ==================================================================================================
  @override
  Future<List<RecentActivity>> getRecentActivityDataByUser(int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.recentActivityEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final recentActivityList = json
            .map((recentActivity) => RecentActivity.fromJson(recentActivity))
            .toList();
        return recentActivityList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getRecentActivityData');
  }

  /// RESULT OF CHOSEN ACTIVITY DYNAMIC ================================================================================
  @override
  Future<List<CreatedActivityDynamicWithDistance>>
      getResultOfChosenActivityDynamicData(
    int uId,
    List activityTypeDetailList,
    List activityTitleList,
    double locationCircularDiamter,
    double lat,
    double lon,
    int offset,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.resultOfChosenActivityDynamicEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.activityTypeDetailEndPoint +
        _appFunctions.toStringForApiRequest(activityTypeDetailList) +
        ApiConstants.activityTitleEndPoint +
        _appFunctions.toStringForApiRequest(activityTitleList) +
        ApiConstants.locationCircularDiamterEndPoint +
        locationCircularDiamter.floor().toString() +
        ApiConstants.lat +
        lat.toStringAsFixed(3) +
        ApiConstants.lon +
        lon.toStringAsFixed(3);
    //
    // print(uri);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final resultOfChosenActivityDynamicList = json
            .map((resultOfChosenActivityDynamic) =>
                CreatedActivityDynamicWithDistance.fromJson(
                    resultOfChosenActivityDynamic))
            .toList();
        //
        // print(resultOfChosenActivityDynamicList);
        return resultOfChosenActivityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getResultOfChosenActivityDynamicData');
  }

  /// TRAINING OFFER CONVERSATION DYNAMIC BY USER ======================================================================
  @override
  Future<List<TrainingOfferConversationDynamic>>
      getTrainingOfferConversationDynamicDataByUser(int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferConversationDynamicByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferConversationDynamicList = json
            .map((trainingOfferConversationDynamic) =>
                TrainingOfferConversationDynamic.fromJson(
                    trainingOfferConversationDynamic))
            .toList();
        return trainingOfferConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferConversationDynamicDataByUser');
  }

  /// FIND A COACH CONVERSATION DYNAMIC BY TRAINEE ===================================================================
  @override
  Future<List<TrainingOfferConversationDynamic>>
      getFindACoachConversationDynamicDataByTrainee(
          int traineeId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.findACoachConversationDynamicByUserTraineePoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.traineeId +
        traineeId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferConversationDynamicList = json
            .map((trainingOfferConversationDynamic) =>
                TrainingOfferConversationDynamic.fromJson(
                    trainingOfferConversationDynamic))
            .toList();
        return trainingOfferConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getFindACoachConversationDynamicDataByTrainee');
  }

  /// TRAINING OFFER DYNAMIC OFFERED BY COACH ==========================================================================
  @override
  Future<List<TrainingOfferDynamic>> getTrainingOfferDynamicDataOfferedByCoach(
      int coachId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferDynamicOfferedByCoachEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.coachId +
        coachId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);

    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferDynamicList = json
            .map((trainingOfferDynamic) =>
                TrainingOfferDynamic.fromJson(trainingOfferDynamic))
            .toList();
        //
        // print('trainingOfferDynamicList: $trainingOfferDynamicList');
        return trainingOfferDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferDynamicDataOfferedByCoach');
  }

  /// TRAINING OFFER DYNAMIC WITH DISTANCE BY USER =====================================================================
  @override
  Future<List<TrainingOfferDynamicWithDistance>>
      getTrainingOfferDynamicWithDistanceDataByUser(
          int uId, String activityTitle, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferDynamicWithDistanceByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.activityTitleEndPoint +
        activityTitle;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferDynamicWithDistanceList = json
            .map((trainingOfferDynamicWithDistance) =>
                TrainingOfferDynamicWithDistance.fromJson(
                    trainingOfferDynamicWithDistance))
            .toList();
        return trainingOfferDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferDynamicWithDistanceDataByUser');
  }

  /// TRAINING OFFER MESSAGE DYNAMIC BY GROUP OF TRAINING OFFER CONVERSATION =======================================
  @override
  Future<List<TrainingOfferMessageDynamic>>
      getTrainingOfferMessageDynamicDataByGroupOfTrainingOfferConversation(
          int uId, List<int?> trainingOfferConversationList) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingOfferMessageDynamicByGroupOfTrainingOfferConversationEndPoint +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.trainingOfferConversationList +
        _appFunctions
            .convertListToConvenientIntApiList(trainingOfferConversationList);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferMessageDynamicList = json
            .map((trainingOfferMessageDynamic) =>
                TrainingOfferMessageDynamic.fromJson(
                    trainingOfferMessageDynamic))
            .toList();
        return trainingOfferMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferMessageDynamicDataByGroupOfTrainingRequestConversation');
  }

  /// TRAINING OFFER MESSAGE DYNAMIC BY TRAINING OFFER CONVERSATION ================================================
  @override
  Future<List<TrainingOfferMessageDynamic>>
      getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
          int uId, int trainingOfferConversationId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingOfferMessageDynamicByTrainingOfferConversationEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.trainingOfferConversationId +
        trainingOfferConversationId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferMessageDynamicList = json
            .map((trainingOfferMessageDynamic) =>
                TrainingOfferMessageDynamic.fromJson(
                    trainingOfferMessageDynamic))
            .toList();
        return trainingOfferMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferMessageDynamicDataByTrainingRequestConversation');
  }

  /// FIND A COACH MESSAGE DYNAMIC BY GROUP OF FIND A COACH CONVERSATION =============================================
  @override
  Future<List<TrainingOfferMessageDynamic>>
      getFindACoachMessageDynamicDataByGroupOfFindACoachConversation(
          int traineeId, List<int?> findACoachConversationList) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .findACoachMessageDynamicByGroupOfFindACoachConversationEndPoint +
        ApiConstants.traineeId +
        traineeId.toString() +
        ApiConstants.findACoachConversationList +
        _appFunctions
            .convertListToConvenientIntApiList(findACoachConversationList);
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferMessageDynamicList = json
            .map((trainingOfferMessageDynamic) =>
                TrainingOfferMessageDynamic.fromJson(
                    trainingOfferMessageDynamic))
            .toList();

        // print(
        //     'trainingOfferMessageDynamicList: $trainingOfferMessageDynamicList');
        return trainingOfferMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getFindACoachMessageDynamicDataByGroupOfFindACoachConversation');
  }

  /// FIND A COACH MESSAGE DYNAMIC BY FIND A COACH CONVERSATION ========================================================
  @override
  Future<List<TrainingOfferMessageDynamic>>
      getFindACoachMessageDynamicDataByFindACoachConversation(
          int traineeId, int findACoachConversationId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.findACoachMessageDynamicByFindACoachConversationEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.traineeId +
        traineeId.toString() +
        ApiConstants.findACoachConversationId +
        findACoachConversationId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferMessageDynamicList = json
            .map((trainingOfferMessageDynamic) =>
                TrainingOfferMessageDynamic.fromJson(
                    trainingOfferMessageDynamic))
            .toList();
        //
        // print(
        //     'trainingOfferMessageDynamicList: ${trainingOfferMessageDynamicList}');
        return trainingOfferMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getFindACoachMessageDynamicDataByFindACoachConversation');
  }

  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// TRAINING OFFER MESSAGE DYNAMIC BY USER ===========================================================================
  @override
  Future<List<TrainingOfferMessageDynamic>>
      getTrainingOfferMessageDynamicDataByUser(int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferMessageDynamicByUserEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferMessageDynamicList = json
            .map((trainingOfferMessageDynamic) =>
                TrainingOfferMessageDynamic.fromJson(
                    trainingOfferMessageDynamic))
            .toList();
        return trainingOfferMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferMessageDynamicDataByUser');
  }

  /// TRAINING OFFER RESPONSE DYNAMIC BY TRAINEE =====================================================================
  @override
  Future<List<TrainingOfferResponseDynamic>>
      getTrainingOfferResponseDynamicDataRespondedByTrainee(
          int traineeId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferResponseDynamicRespondedByTraineeEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.traineeId +
        traineeId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferResponseDynamicList = json
            .map((trainingOfferResponseDynamic) =>
                TrainingOfferResponseDynamic.fromJson(
                    trainingOfferResponseDynamic))
            .toList();
        //
        // print(
        //     'trainingOfferResponseDynamicList: $trainingOfferResponseDynamicList');
        return trainingOfferResponseDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferResponseDynamicDataRespondedByTrainee');
  }

  /// TRAINING OFFER RESPONSE DYNAMIC WITH DISTANCE BY TRAINING OFFER ==================================================
  @override
  Future<List<TrainingOfferResponseDynamicWithDistance>>
      getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
          int trainingOfferId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingOfferResponseDynamicWithDistanceByTrainingOfferEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.trainingOfferId +
        trainingOfferId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferResponseDynamicWithDistanceList = json
            .map((trainingOfferResponseDynamicWithDistance) =>
                TrainingOfferResponseDynamicWithDistance.fromJson(
                    trainingOfferResponseDynamicWithDistance))
            .toList();
        return trainingOfferResponseDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer');
  }

  /// TRAINING OFFER RESPONSE DYNAMIC WITH DISTANCE OF CHOSEN ACTIVITY BY TRAINEE ======================================
  @override
  Future<List<TrainingOfferResponseDynamicWithDistance>>
      getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
          int traineeId, int activityNameId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.traineeId +
        traineeId.toString() +
        ApiConstants.activityNameId +
        activityNameId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferResponseDynamicWithDistanceList = json
            .map((trainingOfferResponseDynamicWithDistance) =>
                TrainingOfferResponseDynamicWithDistance.fromJson(
                    trainingOfferResponseDynamicWithDistance))
            .toList();
        return trainingOfferResponseDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee');
  }

  /// TRAINING OFFER RESPONSE DYNAMIC WITH DISTANCE BY CHOSEN ATTRIBUTES ===============================================
  @override
  Future<List<TrainingOfferResponseDynamicWithDistance>>
      getTrainingOfferResponseDynamicWithDistanceDataByChosenAttributes(
          String activityTitle, int userId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingOfferResponseDynamicWithDistanceByChosenAttributes +
        ApiConstants.activityTitleEndPoint +
        activityTitle +
        ApiConstants.userId +
        userId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);

    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferResponseDynamicWithDistanceList = json
            .map((trainingOfferResponseDynamicWithDistance) =>
                TrainingOfferResponseDynamicWithDistance.fromJson(
                    trainingOfferResponseDynamicWithDistance))
            .toList();
        return trainingOfferResponseDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferResponseDynamicWithDistanceDataByRespondedByUser');
  }

  /// TRAINING REQUEST CONVERSATION DYNAMIC BY USER ====================================================================
  @override
  Future<List<TrainingRequestConversationDynamic>>
      getTrainingRequestConversationDynamicDataByUser(
          int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestConversationDynamicByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestConversationDynamicList = json
            .map((trainingRequestConversationDynamic) =>
                TrainingRequestConversationDynamic.fromJson(
                    trainingRequestConversationDynamic))
            .toList();
        return trainingRequestConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestConversationDynamicDataByUser');
  }

  /// TRAINING REQUEST DYNAMIC REQUESTED BY COACH ======================================================================
  @override
  Future<List<TrainingRequestDynamic>>
      getTrainingRequestDynamicDataRequestedByUser(int uId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestDynamicRequestedByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestDynamicList = json
            .map((trainingRequestDynamic) =>
                TrainingRequestDynamic.fromJson(trainingRequestDynamic))
            .toList();
        return trainingRequestDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestDynamicDataRequestedByUser');
  }

  /// TRAINING REQUEST DYNAMIC WITH DISTANCE BY USER ===================================================================
  @override
  Future<List<TrainingRequestDynamicWithDistance>>
      getTrainingRequestDynamicWithDistanceDataByUser(
          int uId, String activityTitle, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestDynamicWithDistanceByUserEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.activityTitleEndPoint +
        activityTitle;
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestDynamicWithDistanceList = json
            .map((trainingRequestDynamicWithDistance) =>
                TrainingRequestDynamicWithDistance.fromJson(
                    trainingRequestDynamicWithDistance))
            .toList();
        return trainingRequestDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestDynamicWithDistanceDataByUser');
  }

  /// TRAINING REQUEST MESSAGE DYNAMIC BY GROUP OF TRAINING REQUEST CONVERSATION =======================================
  @override
  Future<List<TrainingRequestMessageDynamic>>
      getTrainingRequestMessageDynamicDataByGroupOfTrainingRequestConversation(
          int uId, List<int?> trainingRequestConversationList) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingRequestMessageDynamicByGroupOfTrainingRequestConversationEndPoint +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.trainingRequestConversationList +
        _appFunctions
            .convertListToConvenientIntApiList(trainingRequestConversationList);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestMessageDynamicList = json
            .map((trainingRequestMessageDynamic) =>
                TrainingRequestMessageDynamic.fromJson(
                    trainingRequestMessageDynamic))
            .toList();
        return trainingRequestMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestMessageDynamicDataByGroupOfTrainingRequestConversation');
  }

  /// TRAINING REQUEST MESSAGE DYNAMIC BY TRAINING REQUEST CONVERSATION ================================================
  @override
  Future<List<TrainingRequestMessageDynamic>>
      getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
          int uId, int trainingRequestConversationId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingRequestMessageDynamicByTrainingRequestConversationEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.trainingRequestConversationId +
        trainingRequestConversationId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(uri);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestMessageDynamicList = json
            .map((trainingRequestMessageDynamic) =>
                TrainingRequestMessageDynamic.fromJson(
                    trainingRequestMessageDynamic))
            .toList();
        return trainingRequestMessageDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestMessageDynamicDataByTrainingRequestConversation');
  }

  /// TRAINING REQUEST RESPONSE DYNAMIC WITH DISTANCE BY TRAINING REQUEST ==============================================
  @override
  Future<List<TrainingRequestResponseDynamicWithDistance>>
      getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
          int trainingRequestId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingRequestResponseDynamicWithDistanceByTrainingRequestEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.trainingRequestId +
        trainingRequestId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(rawDataResponse.statusCode);
    // print(rawDataResponse.body);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestResponseDynamicWithDistanceList = json
            .map((trainingRequestResponseDynamicWithDistance) =>
                TrainingRequestResponseDynamicWithDistance.fromJson(
                    trainingRequestResponseDynamicWithDistance))
            .toList();
        //
        // print(trainingRequestResponseDynamicWithDistanceList);
        return trainingRequestResponseDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest');
  }

  /// TRAINING REQUEST RESPONSE DYNAMIC WITH DISTANCE BY CHOSEN ATTRIBUTES =============================================
  @override
  Future<List<TrainingRequestResponseDynamicWithDistance>>
      getTrainingRequestResponseDynamicWithDistanceDataByChosenAttributes(
          String activityTitle, int coachUserId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .trainingRequestResponseDynamicWithDistanceByChosenAttributes +
        ApiConstants.activityTitleEndPoint +
        activityTitle +
        ApiConstants.coachUserId +
        coachUserId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);

    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestResponseDynamicWithDistanceList = json
            .map((trainingRequestResponseDynamicWithDistance) =>
                TrainingRequestResponseDynamicWithDistance.fromJson(
                    trainingRequestResponseDynamicWithDistance))
            .toList();
        //
        // print(
        //     'trainingRequestResponseDynamicWithDistanceList: $trainingRequestResponseDynamicWithDistanceList');
        return trainingRequestResponseDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestResponseDynamicWithDistanceDataByRespondedByUser');
  }

  /// USER =============================================================================================================
  @override
  Future<List<User>> getUserDataByUser(int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.userEndPoint +
        ApiConstants.separatrix +
        uId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);

    //
    // print(jsonDecode(rawDataResponse.body));
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        /// ? THIS CODE ADDED BECAUSE THe ONLY ONE ID REQUESTED AND IT NEEDS TO CONVERT TO LIST
        final json = [];
        json.add(jsonDecode(rawDataResponse.body));
        final userList = json.map((user) => User.fromJson(user)).toList();
        return userList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getUserDataByUser');
  }

  /// USER DYNAMIC =====================================================================================================
  @override
  Future<List<UserDynamic>> getUserDynamicDataByUser(int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.userDynamicEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);

    //
    // print(jsonDecode(rawDataResponse.body));
    // print(jsonDecode(rawDataResponse.body).runtimeType);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final userDynamicList = json
            .map((userDynamic) => UserDynamic.fromJson(userDynamic))
            .toList();
        return userDynamicList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on getUserDynamicDataByUser');
  }

  /// USER FOLLOWING DYNAMIC ===========================================================================================
  @override
  Future<List<UserFollowingDynamic>> getUserFollowingDynamicDataByUser(
      int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.userFollowingDynamicByUserEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final userFollowingDynamicList = json
            .map((userFollowingDynamic) =>
                UserFollowingDynamic.fromJson(userFollowingDynamic))
            .toList();
        return userFollowingDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getUserFollowingDynamicDataByUser');
  }

  /// USER LIKING DYNAMIC ============================================================================================
  @override
  Future<List<UserLikingDynamic>> getUserLikingDynamicDataByUser(
      int uId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.userLikingDynamicByUserEndPoint +
        ApiConstants.userId +
        uId.toString();
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);

    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final userLikingDynamicList = json
            .map((userLikingDynamic) =>
                UserLikingDynamic.fromJson(userLikingDynamic))
            .toList();
        return userLikingDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getUserLikingDynamicDataByUser');
  }

  /// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX =======================================================
  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset(
          int createdActivityId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.createdActivityId +
        createdActivityId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final consistedActivityDynamicWithDistanceList = json
            .map((consistedActivityDynamicWithDistance) =>
                ConsistedActivityDynamicWithDistance.fromJson(
                    consistedActivityDynamicWithDistance))
            .toList();
        return consistedActivityDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset');
  }

  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess(
          int createdActivityId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants
            .consistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.createdActivityId +
        createdActivityId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final consistedActivityDynamicWithDistanceList = json
            .map((consistedActivityDynamicWithDistance) =>
                ConsistedActivityDynamicWithDistance.fromJson(
                    consistedActivityDynamicWithDistance))
            .toList();
        return consistedActivityDynamicWithDistanceList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess');
  }

  @override
  Future<List<ConsistedActivityDynamic>>
      getConsistedActivityDynamicDataByCreatedActivityAttendee(
    int createdActivityId,
    int attendeeId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.consistedActivityDynamicByCreatedActivityAttendee +
        ApiConstants.createdActivityId +
        createdActivityId.toString() +
        ApiConstants.attendeeId +
        attendeeId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final consistedActivityDynamicList = json
            .map((consistedActivityDynamic) =>
                ConsistedActivityDynamic.fromJson(consistedActivityDynamic))
            .toList();
        //
        // print(
        //     'consistedActivityDynamicList in DB: ${consistedActivityDynamicList}');
        return consistedActivityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getConsistedActivityDynamicDataByCreatedActivityAttendee');
  }

  @override
  Future<List<CreatedActivityDynamic>>
      getCreatedActivityDynamicDataByChosenAttributes(
    int activityNameId,
    int hostId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.createdActivityDynamicByChosenAttributes +
        ApiConstants.activityNameId +
        activityNameId.toString() +
        ApiConstants.hostId +
        hostId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final createdActivityDynamicList = json
            .map((createdActivityDynamic) =>
                CreatedActivityDynamic.fromJson(createdActivityDynamic))
            .toList();
        //
        // print('createdActivityDynamicList in DB: $createdActivityDynamicList');
        return createdActivityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getCreatedActivityDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingDetailDynamic>>
      getTrainingDetailDynamicDataByChosenAttributes(
    int activityNameId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingDetailDynamicByChosenAttributes +
        ApiConstants.activityNameId +
        activityNameId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingDetailDynamicList = json
            .map((trainingDetailDynamic) =>
                TrainingDetailDynamic.fromJson(trainingDetailDynamic))
            .toList();
        //
        // print('trainingDetailDynamicList in DB: $trainingDetailDynamicList');
        return trainingDetailDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingDetailDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingOfferDynamic>>
      getTrainingOfferDynamicDataByChosenAttributes(
    int coachId,
    int trainingDetailId,
    int coachingLocationDetailId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferDynamicByChosenAttributes +
        ApiConstants.coachId +
        coachId.toString() +
        ApiConstants.trainingDetailId +
        trainingDetailId.toString() +
        ApiConstants.coachingLocationDetailId +
        coachingLocationDetailId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferDynamicList = json
            .map((trainingOfferDynamic) =>
                TrainingOfferDynamic.fromJson(trainingOfferDynamic))
            .toList();
        //
        // print('trainingOfferDynamicList in DB: $trainingOfferDynamicList');
        return trainingOfferDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingRequestDynamic>>
      getTrainingRequestDynamicDataByChosenAttributes(
    int trainingRequesterId,
    int trainingDetailId,
    int locationDetailId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestDynamicByChosenAttributes +
        ApiConstants.trainingRequesterId +
        trainingRequesterId.toString() +
        ApiConstants.trainingDetailId +
        trainingDetailId.toString() +
        ApiConstants.locationDetailId +
        locationDetailId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse: ${rawDataResponse.statusCode}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestDynamicList = json
            .map((trainingRequestDynamic) =>
                TrainingRequestDynamic.fromJson(trainingRequestDynamic))
            .toList();
        //
        // print('trainingRequestDynamicList in DB: $trainingRequestDynamicList');
        return trainingRequestDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingOfferResponseDynamic>>
      getTrainingOfferResponseDynamicDataByChosenAttributes(
    int trainingOfferId,
    int traineeId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferResponseDynamicByChosenAttributes +
        ApiConstants.trainingOfferId +
        trainingOfferId.toString() +
        ApiConstants.traineeId +
        traineeId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferResponseDynamicList = json
            .map((trainingOfferResponseDynamic) =>
                TrainingOfferResponseDynamic.fromJson(
                    trainingOfferResponseDynamic))
            .toList();

        // print(
        //     'trainingOfferResponseDynamicList in DB: $trainingOfferResponseDynamicList');
        return trainingOfferResponseDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferResponseDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingRequestResponseDynamic>>
      getTrainingRequestResponseDynamicDataByChosenAttributes(
    int trainingRequestId,
    int coachId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestResponseDynamicByChosenAttributes +
        ApiConstants.trainingRequestId +
        trainingRequestId.toString() +
        ApiConstants.coachId +
        coachId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestResponseDynamicList = json
            .map((trainingRequestResponseDynamic) =>
                TrainingRequestResponseDynamic.fromJson(
                    trainingRequestResponseDynamic))
            .toList();

        // print(
        //     'trainingRequestResponseDynamicList in DB: $trainingRequestResponseDynamicList');
        return trainingRequestResponseDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestResponseDynamicDataByChosenAttributes');
  }

  @override
  Future<List<ActivityConversationDynamic>>
      getActivityConversationDynamicDataByChosenAttributes(
    int consistedActivityId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityConversationDynamicByChosenAttributes +
        ApiConstants.consistedActivityId +
        consistedActivityId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityConversationDynamicList = json
            .map((activityConversationDynamic) =>
                ActivityConversationDynamic.fromJson(
                    activityConversationDynamic))
            .toList();

        // print(
        //     'activityConversationDynamicList in DB: $activityConversationDynamicList');
        return activityConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getActivityConversationDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingRequestConversationDynamic>>
      getTrainingRequestConversationDynamicDataByChosenAttributes(
    int trainingRequestResponseId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestConversationDynamicByChosenAttributes +
        ApiConstants.trainingRequestResponseId +
        trainingRequestResponseId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingRequestConversationDynamicList = json
            .map((trainingRequestConversationDynamic) =>
                TrainingRequestConversationDynamic.fromJson(
                    trainingRequestConversationDynamic))
            .toList();
        //
        // print(
        //     'trainingRequestConversationDynamicList in DB: $trainingRequestConversationDynamicList');
        return trainingRequestConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingRequestConversationDynamicDataByChosenAttributes');
  }

  @override
  Future<List<TrainingOfferConversationDynamic>>
      getTrainingOfferConversationDynamicDataByChosenAttributes(
    int trainingOfferResponseId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferConversationDynamicByChosenAttributes +
        ApiConstants.trainingOfferResponseId +
        trainingOfferResponseId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final trainingOfferConversationDynamicList = json
            .map((trainingOfferConversationDynamic) =>
                TrainingOfferConversationDynamic.fromJson(
                    trainingOfferConversationDynamic))
            .toList();
        //
        // print(
        //     'trainingOfferConversationDynamicList in DB: $trainingOfferConversationDynamicList');
        return trainingOfferConversationDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getTrainingOfferConversationDynamicDataByChosenAttributes');
  }

  @override
  Future<List<ContentNumber?>> getAttendedActivityDataByAttendee(
      int attendeeId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.attendedActivityByAttendee +
        ApiConstants.attendeeId +
        attendeeId.toString();
    // print(uri);
    Uri url = Uri.parse(uri);
    //
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final contentNumberList = json
            .map((contentNumber) => ContentNumber.fromJson(contentNumber))
            .toList();
        //
        // print('contentNumberList in DB: $contentNumberList');
        return contentNumberList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getAttendedActivityDataByAttendee');
  }

  @override
  Future<List<CreatedActivityDynamic>> getCreatedActivityDynamicDataByHost(
      int hostId, int offset) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.createdActivityDynamicByHost +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.hostId +
        hostId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final createdActivityDynamicList = json
            .map((createdActivityDynamic) =>
                CreatedActivityDynamic.fromJson(createdActivityDynamic))
            .toList();
        //
        // print('createdActivityDynamicList: $createdActivityDynamicList');
        return createdActivityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getCreatedActivityDynamicDataByHost');
  }

  /// RESULT OF PREFERED ACTIVITY DYNAMIC =============================================================================
  @override
  Future<List<ActivityTile>> getResultOfPreferredActivityDynamicData(
    int uId,
    String activityTitle,
    double locationCircularDiamter,
    double lat,
    double lon,
    int offset,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.resultOfPreferredActivityDynamicEndPoint +
        ApiConstants.limit +
        queryLimit.toString() +
        ApiConstants.offset +
        offset.toString() +
        ApiConstants.userId +
        uId.toString() +
        ApiConstants.activityTitleEndPoint +
        activityTitle +
        ApiConstants.locationCircularDiamterEndPoint +
        locationCircularDiamter.floor().toString() +
        ApiConstants.lat +
        lat.toStringAsFixed(3) +
        ApiConstants.lon +
        lon.toStringAsFixed(3);
    //
    // print(uri);
    Uri url = Uri.parse(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print('rawDataResponse.statusCode: ${rawDataResponse.statusCode}');
    // print('rawDataResponse.body: ${rawDataResponse.body}');
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final resultOfPreferedActivityDynamicList = json
            .map((resultOfPreferedActivityDynamic) =>
                ActivityTile.fromJson(resultOfPreferedActivityDynamic))
            .toList();
        //
        // print(resultOfPreferedActivityDynamicList);
        return resultOfPreferedActivityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on resultOfPreferedActivityDynamicEndPoint');
  }

  /// POST =============================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ACTIVITY TEMPLATE ================================================================================================
  /// Activity Detail Dynamic (reading for posting) ====================================================================
  @override
  Future<List<ActivityNameDynamic>> getActivityNameDynamicByChosenAttributes(
      int activityNameId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityNameDynamicByChosenAttributes +
        ApiConstants.activityNameId +
        activityNameId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    //
    // print(rawDataResponse.statusCode);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final activityNameDynamicList = json
            .map((activityNameDynamic) =>
                ActivityNameDynamic.fromJson(activityNameDynamic))
            .toList();
        //
        // print(activityNameDynamicList);
        // print(activityNameDynamicList.length);
        return activityNameDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getActivityNameDynamicByChosenAttributes');
  }

  /// Activity Template (for posting) ================================================================================
  @override
  Future<List<DBStatus>> postActivityTemplate(
      ActivityTemplate activityTemplate) async {
    String uri = ApiConstants.baseUrl + ApiConstants.activityTemplateEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = activityTemplate.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    //print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postActivityTemplate');
  }

  /// Activity Template (for puting) =================================================================================
  @override
  Future<List<DBStatus>> putActivityTemplate(
      ActivityTemplate activityTemplate) async {
    String uri = ApiConstants.baseUrl + ApiConstants.activityTemplateEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = activityTemplate.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putActivityTemplate');
  }

  /// Activity Template (for deleting) =================================================================================
  @override
  Future<List<DBStatus>> deleteActivityTemplate(int activityTemplateId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityTemplateEndPoint +
        ApiConstants.separatrix +
        activityTemplateId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteActivityTemplate');
  }

  /// USER =============================================================================================================
  /// Country City Dynamic (reading for posting) =======================================================================
  @override
  Future<List<CountryCityDynamic>> getCountryCityDynamicByChosenAttributes(
    int cityId,
    int countryId,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.countryCityDynamicByChosenAttributes +
        ApiConstants.countryId +
        countryId.toString() +
        ApiConstants.cityId +
        cityId.toString();
    Uri url = Uri.parse(uri);

    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final countryCityDynamicList = json
            .map((countryCityDynamic) =>
                CountryCityDynamic.fromJson(countryCityDynamic))
            .toList();
        return countryCityDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getCountryCityDynamicByChosenAttributes');
  }

  /// User (for puting) ==============================================================================================
  @override
  Future<List<DBStatus>> putUser(UserDB userDB) async {
    String uri = ApiConstants.baseUrl + ApiConstants.userEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = userDB.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putUser');
  }

  /// COACH ============================================================================================================
  /// Coaching Experience Dynamic (reading for posting) ================================================================
  @override
  Future<List<CoachingExperienceDynamic>>
      getCoachingExperienceDynamicByChosenAttributes(
          int coachingExperienceYearId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.coachingExperienceDynamicByChosenAttributes +
        ApiConstants.coachingExperienceYearId +
        coachingExperienceYearId.toString();
    Uri url = Uri.parse(uri);

    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final coachingExperienceDynamicList = json
            .map((coachingExperienceDynamic) =>
                CoachingExperienceDynamic.fromJson(coachingExperienceDynamic))
            .toList();
        return coachingExperienceDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getCooachingExperienceDynamicByChosenAttributes');
  }

  /// Coach (for puting) ===============================================================================================
  @override
  Future<List<DBStatus>> putCoach(CoachDB coachDB) async {
    String uri = ApiConstants.baseUrl + ApiConstants.coachEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = coachDB.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putCoach');
  }

  /// LOCATION TEMPLATE ================================================================================================
  /// Location Detail Dynamic (reading for posting) ====================================================================
  @override
  Future<List<LocationDetailDynamic>>
      getLocationDetailDynamicByChosenAttributes(
    double prefferedLocationCircularDiameter,
    double membershipMaxDiameter,
    double lat,
    double lon,
  ) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.locationDetailDynamicByChosenAttributes +
        ApiConstants.prefferedLocationCircularDiameter +
        prefferedLocationCircularDiameter.toString() +
        ApiConstants.membershipMaxDiameter +
        membershipMaxDiameter.toString() +
        ApiConstants.lat +
        lat.toString() +
        ApiConstants.lon +
        lon.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawDataResponse = await http.get(url);
    if (rawDataResponse.statusCode == 200) {
      if (rawDataResponse.body.isNotEmpty) {
        final json = jsonDecode(rawDataResponse.body) as List;
        final locationDetailDynamicList = json
            .map((locationDetailDynamic) =>
                LocationDetailDynamic.fromJson(locationDetailDynamic))
            .toList();
        //
        // print('locationDetailDynamicList in DB: ${locationDetailDynamicList}');
        return locationDetailDynamicList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on getLocationDetailDynamicByChosenAttributes');
  }

  /// Location Template (for posting) ================================================================================
  @override
  Future<List<DBStatus>> postLocationTemplate(
      LocationTemplate locationTemplate) async {
    String uri = ApiConstants.baseUrl + ApiConstants.locationTemplateEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = locationTemplate.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print(rawResponse.statusCode);
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postLocationTemplate');
  }

  /// Location Template (for puting) =================================================================================
  @override
  Future<List<DBStatus>> putLocationTemplate(
      LocationTemplate locationTemplate) async {
    String uri = ApiConstants.baseUrl + ApiConstants.locationTemplateEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = locationTemplate.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putLocationTemplate');
  }

  /// Location Template (for deleting) =================================================================================
  @override
  Future<List<DBStatus>> deleteLocationTemplate(int locationTemplateId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.locationTemplateEndPoint +
        ApiConstants.separatrix +
        locationTemplateId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteLocationTemplate');
  }

  /// Location Detail (for posting) ==================================================================================
  @override
  Future<List<DBStatus>> postLocationDetail(
      LocationDetail locationDetail) async {
    String uri = ApiConstants.baseUrl + ApiConstants.locationDetailEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = locationDetail.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print(rawResponse.statusCode);
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postLocationDetail');
  }

  /// CREATED ACTIVITY =================================================================================================
  /// Created Activity (for posting) =================================================================================
  @override
  Future<List<DBStatus>> postCreatedActivity(
      CreatedActivity createdActivity) async {
    String uri = ApiConstants.baseUrl + ApiConstants.createdActivityEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = createdActivity.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postCreatedActivity');
  }

  /// Created Activity (for puting) ====================================================================================
  @override
  Future<List<DBStatus>> putCreatedActivity(
      CreatedActivity createdActivity) async {
    String uri = ApiConstants.baseUrl + ApiConstants.createdActivityEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = createdActivity.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putCreatedActivity');
  }

  /// Created Activity (for deleting) ==================================================================================
  @override
  Future<List<DBStatus>> deleteCreatedActivity(int createdActivityId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.createdActivityEndPoint +
        ApiConstants.separatrix +
        createdActivityId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteCreatedActivity');
  }

  /// CONSISTED ACTIVITY ===============================================================================================
  /// Consisted Activity (for posting) =================================================================================
  @override
  Future<List<DBStatus>> postConsistedActivity(
      ConsistedActivity consistedActivity) async {
    String uri = ApiConstants.baseUrl + ApiConstants.consistedActivityEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = consistedActivity.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postConsistedActivity');
  }

  /// Consisted Activity (for puting) ==================================================================================
  @override
  Future<List<DBStatus>> putConsistedActivity(
      ConsistedActivity consistedActivity) async {
    String uri = ApiConstants.baseUrl + ApiConstants.consistedActivityEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = consistedActivity.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putConsistedActivity');
  }

  /// Consisted Activity (for deleting) ================================================================================
  @override
  Future<List<DBStatus>> deleteConsistedActivity(
      int consistedActivityId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.consistedActivityEndPoint +
        ApiConstants.separatrix +
        consistedActivityId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteConsistedActivity');
  }

  /// TRAINING OFFER ===================================================================================================
  /// Training Offer (for posting) =====================================================================================
  @override
  Future<List<DBStatus>> postTrainingOffer(TrainingOffer trainingOffer) async {
    String uri = ApiConstants.baseUrl + ApiConstants.trainingOfferEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingOffer.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postTrainingOffer');
  }

  /// Training Offer (for puting) ======================================================================================
  @override
  Future<List<DBStatus>> putTrainingOffer(TrainingOffer trainingOffer) async {
    String uri = ApiConstants.baseUrl + ApiConstants.trainingOfferEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingOffer.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putTrainingOffer');
  }

  /// Training Offer (for deleting) ====================================================================================
  @override
  Future<List<DBStatus>> deleteTrainingOffer(int trainingOfferId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferEndPoint +
        ApiConstants.separatrix +
        trainingOfferId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteTrainingOffer');
  }

  /// TRAINING OFFER RESPONSE ==========================================================================================
  /// Training Offer Response (for posting) ============================================================================
  @override
  Future<List<DBStatus>> postTrainingOfferResponse(
      TrainingOfferResponse trainingOfferResponse) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingOfferResponseEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingOfferResponse.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postTrainingOfferResponse');
  }

  /// Training Offer Response (for puting) ============================================================================
  @override
  Future<List<DBStatus>> putTrainingOfferResponse(
      TrainingOfferResponse trainingOfferResponse) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingOfferResponseEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingOfferResponse.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putTrainingOfferResponse');
  }

  /// Training Offer Response (for deleting) ===========================================================================
  @override
  Future<List<DBStatus>> deleteTrainingOfferResponse(
      int trainingOfferResponseId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferResponseEndPoint +
        ApiConstants.separatrix +
        trainingOfferResponseId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteTrainingOfferResponse');
  }

  /// TRAINING REQUEST ===============================================================================================
  /// Training Request (for posting) ===================================================================================
  @override
  Future<List<DBStatus>> postTrainingRequest(
      TrainingRequest trainingRequest) async {
    String uri = ApiConstants.baseUrl + ApiConstants.trainingRequestEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingRequest.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.status: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postTrainingRequest');
  }

  /// Training Request (for puting) ====================================================================================
  @override
  Future<List<DBStatus>> putTrainingRequest(
      TrainingRequest trainingRequest) async {
    String uri = ApiConstants.baseUrl + ApiConstants.trainingRequestEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingRequest.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putTrainingRequest');
  }

  /// Training Request (for deleting) ==================================================================================
  @override
  Future<List<DBStatus>> deleteTrainingRequest(int trainingRequestId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestEndPoint +
        ApiConstants.separatrix +
        trainingRequestId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteTrainingRequest');
  }

  /// TRAINING REQUEST RESPONSE ========================================================================================
  /// Training Request Response (for posting) ==========================================================================
  @override
  Future<List<DBStatus>> postTrainingRequestResponse(
      TrainingRequestResponse trainingRequestResponse) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingRequestResponseEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingRequestResponse.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postTrainingRequestResponse');
  }

  /// Training Request Response (for puting) ===========================================================================
  @override
  Future<List<DBStatus>> putTrainingRequestResponse(
      TrainingRequestResponse trainingRequestResponse) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingRequestResponseEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingRequestResponse.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putTrainingRequestResponse');
  }

  /// Training Request Response (for deleting) =========================================================================
  @override
  Future<List<DBStatus>> deleteTrainingRequestResponse(
      int trainingRequestResponseId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestResponseEndPoint +
        ApiConstants.separatrix +
        trainingRequestResponseId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on deleteTrainingRequestResponse');
  }

  /// ACTIVITY CONVERSATION ============================================================================================
  /// Activity Conversation (for posting) ==============================================================================
  @override
  Future<List<DBStatus>> postActivityConversation(
      ActivityConversation activityConversation) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.activityConversationEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = activityConversation.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on postActivityConversation');
  }

  /// Activity Conversation (for puting) ===============================================================================
  @override
  Future<List<DBStatus>> putActivityConversation(
      ActivityConversation activityConversation) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.activityConversationEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = activityConversation.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putActivityConversation');
  }

  /// Activity Conversation (for deleting) =============================================================================
  @override
  Future<List<DBStatus>> deleteActivityConversation(
      int activityConversationId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.activityConversationEndPoint +
        ApiConstants.separatrix +
        activityConversationId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on deleteActivityConversation');
  }

  /// TRAINING REQUEST CONVERSATION ====================================================================================
  /// Training Request Conversation (for posting) ======================================================================
  @override
  Future<List<DBStatus>> postTrainingRequestConversation(
      TrainingRequestConversation trainingRequestConversation) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingRequestConversationEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingRequestConversation.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on postTrainingRequestConversation');
  }

  /// Training Request Conversation (for puting) =======================================================================
  @override
  Future<List<DBStatus>> putTrainingRequestConversation(
      TrainingRequestConversation trainingRequestConversation) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingRequestConversationEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingRequestConversation.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on putTrainingRequestConversation');
  }

  /// Training Request Conversation (for deleting) =====================================================================
  @override
  Future<List<DBStatus>> deleteTrainingRequestConversation(
      int trainingRequestConversationId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingRequestConversationEndPoint +
        ApiConstants.separatrix +
        trainingRequestConversationId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on deleteTrainingRequestConversation');
  }

  /// TRAINING OFFER CONVERSATION ======================================================================================
  /// Training Offer Conversation (for posting) ========================================================================
  @override
  Future<List<DBStatus>> postTrainingOfferConversation(
      TrainingOfferConversation trainingOfferConversation) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingOfferConversationEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingOfferConversation.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.post(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.status: ${rawResponse.statusCode}');
    // print('rawResponse.body: ${rawResponse.body}');
    if (rawResponse.statusCode == 201) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on postTrainingOfferConversation');
  }

  /// Training Offer Conversation (for puting) =========================================================================
  @override
  Future<List<DBStatus>> putTrainingOfferConversation(
      TrainingOfferConversation trainingOfferConversation) async {
    String uri =
        ApiConstants.baseUrl + ApiConstants.trainingOfferConversationEndPoint;
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    Map<String, dynamic> body = trainingOfferConversation.toJson();
    //
    // print(body);
    http.Response rawResponse = await http.put(url,
        body: json.encode(body), headers: {"Content-Type": "application/json"});
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception('Something has gone wrong on putTrainingOfferConversation');
  }

  /// Training Offer Conversation (for deleting) =======================================================================
  @override
  Future<List<DBStatus>> deleteTrainingOfferConversation(
      int trainingOfferConversationId) async {
    String uri = ApiConstants.baseUrl +
        ApiConstants.trainingOfferConversationEndPoint +
        ApiConstants.separatrix +
        trainingOfferConversationId.toString();
    Uri url = Uri.parse(uri);
    //
    // print(uri);
    http.Response rawResponse = await http.delete(url);
    //
    // print('rawResponse.body: ${rawResponse.body}');
    // print('rawResponse.statusCode: ${rawResponse.statusCode}');
    if (rawResponse.statusCode == 200) {
      if (rawResponse.body.isNotEmpty) {
        final json = [];
        json.add(jsonDecode(rawResponse.body));
        final dbStatusList =
            json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        //final json = jsonDecode(rawResponse.body) as List;
        // final dbStatusList =
        //     json.map((dbStatus) => DBStatus.fromJson(dbStatus)).toList();
        //
        // print(dbStatusList);
        return dbStatusList;
      } else {
        return [];
      }
    }
    throw Exception(
        'Something has gone wrong on deleteTrainingOfferConversation');
  }
}

// /// NUMBER OF ACTIVITIES BY TIME PERIOD ==============================================================================
// @override
// Future<List<DetailNumber>> getNumberOfActivitiesByTimePeriod(
//     int uId, String activityDate) async {
//   String uri = ApiConstants.baseUrl +
//       ApiConstants.numberOfActivitiesByTimePeriodEndPoint +
//       ApiConstants.userId +
//       uId.toString() +
//       ApiConstants.activityDate +
//       activityDate;
//   Uri url = Uri.parse(uri);
//   http.Response rawDataResponse = await http.get(url);

//   if (rawDataResponse.statusCode == 200) {
//     if (rawDataResponse.body.isNotEmpty) {
//       final json = jsonDecode(rawDataResponse.body) as List;
//       final numberOfActivityList = json
//           .map((numberOfActivity) => DetailNumber.fromJson(numberOfActivity))
//           .toList();
//       return numberOfActivityList;
//     } else {
//       return [];
//     }
//   }
//   throw Exception(
//       'Something has gone wrong on getNumberOfActivitiesByTimePeriod');
// }

// ApiConstants.activityDate +
//         _appDateFormat.queryDateFormat.format(DateFormat('yyyy-MM-dd hh:mm:ss')
//             .parse('2030-12-31 00:00:00')
//             .add(_appDateConstants.activityDayRangeBetweenStartAndEndDateZero))

        // ApiConstants.activityDate +
        // _appDateFormat.queryDateFormat.format(DateTime.now()
        //     .add(_appDateConstants.activityDayRangeBetweenStartAndEndDateZero))

         /// NUMBER OF ACTIVITIES BY ACTIVITY NAME ============================================================================
  // @override
  // Future<List<DetailNumber>> getNumberOfActivitiesByActivityName(
  //     int uId, String activityDate, List<String> activityTypeDetailList) async {
  //   String uri = ApiConstants.baseUrl +
  //       ApiConstants.numberOfActivitiesByActivityNameEndPoint +
  //       ApiConstants.userId +
  //       uId.toString() +
  //       ApiConstants.activityDate +
  //       activityDate +
  //       ApiConstants.activityTypeDetailEndPoint +
  //       _appFunctions.toStringForApiRequest(activityTypeDetailList);
  //   Uri url = Uri.parse(uri);
  //   http.Response rawDataResponse = await http.get(url);

  //   if (rawDataResponse.statusCode == 200) {
  //     if (rawDataResponse.body.isNotEmpty) {
  //       final json = jsonDecode(rawDataResponse.body) as List;
  //       final numberOfActivityList = json
  //           .map((numberOfActivity) => DetailNumber.fromJson(numberOfActivity))
  //           .toList();
  //       return numberOfActivityList;
  //     } else {
  //       return [];
  //     }
  //   }
  //   throw Exception(
  //       'Something has gone wrong on getNumberOfActivitiesByActivityName');
  // }

  // /// NUMBER OF ACTIVITIES BY ACTIVITY TYPE ============================================================================
  // @override
  // Future<List<DetailNumber>> getNumberOfActivitiesByActivityType(
  //     int uId, String activityDate) async {
  //   String uri = ApiConstants.baseUrl +
  //       ApiConstants.numberOfActivitiesByActivityTypeEndPoint +
  //       ApiConstants.userId +
  //       uId.toString() +
  //       ApiConstants.activityDate +
  //       activityDate;
  //   Uri url = Uri.parse(uri);
  //   http.Response rawDataResponse = await http.get(url);

  //   if (rawDataResponse.statusCode == 200) {
  //     if (rawDataResponse.body.isNotEmpty) {
  //       final json = jsonDecode(rawDataResponse.body) as List;
  //       final numberOfActivityList = json
  //           .map((numberOfActivity) => DetailNumber.fromJson(numberOfActivity))
  //           .toList();
  //       return numberOfActivityList;
  //     } else {
  //       return [];
  //     }
  //   }
  //   throw Exception(
  //       'Something has gone wrong on getNumberOfActivitiesByActivityType');
  // }

  // /// NUMBER OF ACTIVITIES BY DATE =====================================================================================
  // @override
  // Future<List<int>?> getNumberOfActivitiesByDate(
  //     int uId, String activityDate) async {
  //   String uri = ApiConstants.baseUrl +
  //       ApiConstants.numberOfActivitiesByDateEndPoint +
  //       ApiConstants.userId +
  //       uId.toString() +
  //       ApiConstants.activityDate +
  //       activityDate;
  //   Uri url = Uri.parse(uri);
  //   http.Response rawDataResponse = await http.get(url);

  //   if (rawDataResponse.statusCode == 200) {
  //     if (rawDataResponse.body.isNotEmpty) {
  //       final json = jsonDecode(rawDataResponse.body) as List;
  //       final numberOfActivityList = json
  //           .map((numberOfActivity) => DetailNumber.fromJson(numberOfActivity))
  //           .map((e) => e.number)
  //           .toList();
  //       return numberOfActivityList;
  //     } else {
  //       return [];
  //     }
  //   }
  //   throw Exception('Something has gone wrong on getNumberOfActivitiesByDate');
  // }


        // ApiConstants.beginningDateEndPoint +
        // _appDateFormat.queryDateFormat
        //     .format(_appDateFormat.pickerDateRangeFormat.parse(beginningDate)) +
        // ApiConstants.endingDateEndPoint +
        // _appDateFormat.queryDateFormat
        //     .format(_appDateFormat.pickerDateRangeFormat.parse(endingDate)) +