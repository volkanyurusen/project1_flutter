import 'package:my_project/base/database_base.dart';
import 'package:my_project/db/db_provider.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/models/models_reading/xmodels_reading.dart';

class Repositories implements DatabaseBase {
  final DbProvider _dbProvider = DbProvider();

  // ACTIVITY CONVERSATION DYNAMIC =====================================================================================
  @override
  Future<List<ActivityConversationDynamic>>
      getActivityConversationDynamicDataByUser(int uId, int offset) async =>
          _dbProvider.getActivityConversationDynamicDataByUser(uId, offset);

  // ACTIVITY MESSAGE DYNAMIC ==========================================================================================
  @override
  Future<List<MessageDynamic>> getActivityMessageDynamicDataByUser(
          int uId) async =>
      _dbProvider.getActivityMessageDynamicDataByUser(uId);

  @override
  Future<List<MessageDynamic>>
      getMessageDynamicDataByGroupOfActivityConversation(
              int uId, int offset) async =>
          _dbProvider.getMessageDynamicDataByGroupOfActivityConversation(
              uId, offset);

  @override
  Future<List<MessageDynamic>> getMessageDynamicDataByActivityConversation(
          int createdActivityId, int offset) async =>
      _dbProvider.getMessageDynamicDataByActivityConversation(
          createdActivityId, offset);

  // ACTIVITY NAME DYNAMIC =============================================================================================
  @override
  Future<List<ActivityNameDynamic>> getAllActivityNameDynamicData() async =>
      _dbProvider.getAllActivityNameDynamicData();

  @override
  Future<List<ActivityNameDynamic>> getActivityNameDynamicDataByActivityType(
          activityTypeList) =>
      _dbProvider.getActivityNameDynamicDataByActivityType(activityTypeList);

  // ACTIVITY TEMPLATE DYNAMIC =========================================================================================
  @override
  Future<List<ActivityTemplateDynamic>> getActivityTemplateDynamicDataByUser(
          int uId, int offset) async =>
      _dbProvider.getActivityTemplateDynamicDataByUser(uId, offset);

  // ACTIVITY TYPE DYNAMIC =============================================================================================
  @override
  Future<List<ActivityTypeDynamic>> getAllActivityTypeDynamicData() async =>
      _dbProvider.getAllActivityTypeDynamicData();

  // CITY DYNAMIC ======================================================================================================
  @override
  Future<List<CityDynamic>> getCityDynamicDataByCountry(
          String countryDetail) async =>
      _dbProvider.getCityDynamicDataByCountry(countryDetail);

  // COACH  ============================================================================================================
  @override
  Future<List<Coach>> getCoachData(int coachId) async =>
      _dbProvider.getCoachData(coachId);

  // COACH DYNAMIC =====================================================================================================
  @override
  Future<List<CoachDynamic>> getCoachDynamicData(int coachId) async =>
      _dbProvider.getCoachDynamicData(coachId);

  // COACHING EXPERIENCE DYNAMIC =======================================================================================
  @override
  Future<List<CoachingExperienceDynamic>>
      getAllCoachingExperienceDynamicData() async =>
          _dbProvider.getAllCoachingExperienceDynamicData();

  // COACHING TYPE =====================================================================================================
  @override
  Future<List<CoachingType>> getAllCoachingTypeData() async =>
      _dbProvider.getAllCoachingTypeData();

  // CONSISTED ACTIVITY DYNAMIC WITH DISTANCE ==========================================================================
  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataAttendedByUser(
              int uId, int offset) async =>
          _dbProvider.getConsistedActivityDynamicWithDistanceDataAttendedByUser(
              uId, offset);

  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataByUser(int uId) async =>
          _dbProvider.getConsistedActivityDynamicWithDistanceDataByUser(uId);

  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataCreatedByUser(
              int createdActivityId) async =>
          _dbProvider.getConsistedActivityDynamicWithDistanceDataCreatedByUser(
              createdActivityId);

  // COUNTRY CITY DYNAMIC ==============================================================================================
  @override
  Future<List<CountryCityDynamic>> getCountryCityDynamicDataById(
          int countryCityId) async =>
      _dbProvider.getCountryCityDynamicDataById(countryCityId);

  // COUNTRY DYNAMIC ===================================================================================================
  @override
  Future<List<CountryDynamic>> getAllCountryDynamicData() async =>
      _dbProvider.getAllCountryDynamicData();

  // CREATED ACTIVITY DYNAMIC WITH DISTANCE ==========================================================================
  @override
  Future<List<CreatedActivityDynamicWithDistance>>
      getCreatedActivityDynamicWithDistanceDataCreatedByUser(
              int uId, int offset) async =>
          _dbProvider.getCreatedActivityDynamicWithDistanceDataCreatedByUser(
              uId, offset);

  // GENDER DYNAMIC ====================================================================================================
  @override
  Future<List<GenderDynamic>> getAllGenderDynamicData() async =>
      _dbProvider.getAllGenderDynamicData();

  // LOCATION TEMPLATE DYNAMIC =========================================================================================
  @override
  Future<List<LocationTemplateDynamic>> getLocationTemplateDynamicDataByUser(
          int uId, int offset) async =>
      _dbProvider.getLocationTemplateDynamicDataByUser(uId, offset);

  // MEMBERHIP TYPE ====================================================================================================
  @override
  Future<List<MembershipType>> getAllMembershipTypeData() async =>
      _dbProvider.getAllMembershipTypeData();


  // PROCESS DETAIL DYNAMIC ============================================================================================
  @override
  Future<List<ProcessDetailDynamic>> getAllProcessDetailDynamicData() async =>
      _dbProvider.getAllProcessDetailDynamicData();

  // RECENT ACTIVITY ===================================================================================================
  @override
  Future<List<RecentActivity>> getRecentActivityDataByUser(int uId) async =>
      _dbProvider.getRecentActivityDataByUser(uId);

  @override
  Future<List<CreatedActivityDynamicWithDistance>>
      getResultOfChosenActivityDynamicData(
    int id,
    List activityTypeDetailList,
    List activityTitleList,
    double locationCircularDiamter,
    double lat,
    double lon,
    int offset,
  ) async =>
          _dbProvider.getResultOfChosenActivityDynamicData(
              id,
              activityTypeDetailList,
              activityTitleList,
              locationCircularDiamter,
              lat,
              lon,
              offset);

  // TRAINING OFFER CONVERSATION DYNAMIC ===============================================================================
  @override
  Future<List<TrainingOfferConversationDynamic>>
      getTrainingOfferConversationDynamicDataByUser(
              int uId, int offset) async =>
          _dbProvider.getTrainingOfferConversationDynamicDataByUser(
              uId, offset);

  @override
  Future<List<TrainingOfferConversationDynamic>>
      getFindACoachConversationDynamicDataByTrainee(
              int traineeId, int offset) async =>
          _dbProvider.getFindACoachConversationDynamicDataByTrainee(
              traineeId, offset);

  // TRAINING OFFER DYNAMIC ============================================================================================
  @override
  Future<List<TrainingOfferDynamic>> getTrainingOfferDynamicDataOfferedByCoach(
          int coachId, int offset) async =>
      _dbProvider.getTrainingOfferDynamicDataOfferedByCoach(coachId, offset);

  // TRAINING OFFER DYNAMIC WITH DISTANCE ==============================================================================
  @override
  Future<List<TrainingOfferDynamicWithDistance>>
      getTrainingOfferDynamicWithDistanceDataByUser(
              int uId, String activityTitle, int offset) async =>
          _dbProvider.getTrainingOfferDynamicWithDistanceDataByUser(
              uId, activityTitle, offset);

  // TRAINING OFFER MESSAGE DYNAMIC ====================================================================================
  @override
  Future<List<TrainingOfferMessageDynamic>>
      getTrainingOfferMessageDynamicDataByUser(int uId) async =>
          _dbProvider.getTrainingOfferMessageDynamicDataByUser(uId);

  @override
  Future<List<TrainingOfferMessageDynamic>>
      getTrainingOfferMessageDynamicDataByGroupOfTrainingOfferConversation(
              int uId, List<int?> trainingOfferConversationList) async =>
          _dbProvider
              .getTrainingOfferMessageDynamicDataByGroupOfTrainingOfferConversation(
                  uId, trainingOfferConversationList);

  @override
  Future<List<TrainingOfferMessageDynamic>>
      getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
              int uId, int trainingOfferConversationId, int offset) async =>
          _dbProvider
              .getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
                  uId, trainingOfferConversationId, offset);

  @override
  Future<List<TrainingOfferMessageDynamic>>
      getFindACoachMessageDynamicDataByGroupOfFindACoachConversation(
              int traineeId, List<int?> findACoachConversationList) async =>
          _dbProvider
              .getFindACoachMessageDynamicDataByGroupOfFindACoachConversation(
                  traineeId, findACoachConversationList);

  @override
  Future<List<TrainingOfferMessageDynamic>>
      getFindACoachMessageDynamicDataByFindACoachConversation(
              int traineeId, int findACoachConversationId, int offset) async =>
          _dbProvider.getFindACoachMessageDynamicDataByFindACoachConversation(
              traineeId, findACoachConversationId, offset);

  // TRAINING OFFER RESPONSE DYNAMIC  ==================================================================================
  @override
  Future<List<TrainingOfferResponseDynamic>>
      getTrainingOfferResponseDynamicDataRespondedByTrainee(
              int traineeId, int offset) async =>
          _dbProvider.getTrainingOfferResponseDynamicDataRespondedByTrainee(
              traineeId, offset);

  // TRAINING OFFER RESPONSE DYNAMIC WITH DISTANCE =====================================================================
  @override
  Future<List<TrainingOfferResponseDynamicWithDistance>>
      getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
              int trainingOfferId, int offset) async =>
          _dbProvider
              .getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
                  trainingOfferId, offset);

  @override
  Future<List<TrainingOfferResponseDynamicWithDistance>>
      getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
              int traineeId, int activityNameId, int offset) async =>
          _dbProvider
              .getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
                  traineeId, activityNameId, offset);

  @override
  Future<List<TrainingOfferResponseDynamicWithDistance>>
      getTrainingOfferResponseDynamicWithDistanceDataByChosenAttributes(
              String activityTitle, int userId) async =>
          _dbProvider
              .getTrainingOfferResponseDynamicWithDistanceDataByChosenAttributes(
                  activityTitle, userId);

  // TRAINING REQUEST CONVERSATION DYNAMIC =============================================================================
  @override
  Future<List<TrainingRequestConversationDynamic>>
      getTrainingRequestConversationDynamicDataByUser(
              int uId, int offset) async =>
          _dbProvider.getTrainingRequestConversationDynamicDataByUser(
              uId, offset);

  // TRAINING REQUEST DYNAMIC ==========================================================================================
  @override
  Future<List<TrainingRequestDynamic>>
      getTrainingRequestDynamicDataRequestedByUser(int uId, int offset) async =>
          _dbProvider.getTrainingRequestDynamicDataRequestedByUser(uId, offset);

  // TRAINING REQUEST DYNAMIC WITH DISTANCE ============================================================================
  @override
  Future<List<TrainingRequestDynamicWithDistance>>
      getTrainingRequestDynamicWithDistanceDataByUser(
              int uId, String activityTitle, int offset) async =>
          _dbProvider.getTrainingRequestDynamicWithDistanceDataByUser(
              uId, activityTitle, offset);

  // TRAINING REQUEST MESSAGE DYNAMIC ==================================================================================
  @override
  Future<List<TrainingRequestMessageDynamic>>
      getTrainingRequestMessageDynamicDataByGroupOfTrainingRequestConversation(
              int uId, List<int?> trainingRequestConversationList) async =>
          _dbProvider
              .getTrainingRequestMessageDynamicDataByGroupOfTrainingRequestConversation(
                  uId, trainingRequestConversationList);

  @override
  Future<List<TrainingRequestMessageDynamic>>
      getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
              int uId, int trainingRequestConversationId, int offset) async =>
          _dbProvider
              .getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
                  uId, trainingRequestConversationId, offset);

  // TRAINING REQUEST RESPONSE DYNAMIC WITH DISTANCE ===================================================================
  @override
  Future<List<TrainingRequestResponseDynamicWithDistance>>
      getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
              int trainingRequestId, int offset) async =>
          _dbProvider
              .getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
                  trainingRequestId, offset);

  @override
  Future<List<TrainingRequestResponseDynamicWithDistance>>
      getTrainingRequestResponseDynamicWithDistanceDataByChosenAttributes(
              String activityTitle, int coachUserId) async =>
          _dbProvider
              .getTrainingRequestResponseDynamicWithDistanceDataByChosenAttributes(
                  activityTitle, coachUserId);

  // USER ==============================================================================================================
  @override
  Future<List<User>> getUserDataByUser(int uId) async =>
      _dbProvider.getUserDataByUser(uId);

  // USER DYNAMIC ======================================================================================================
  @override
  Future<List<UserDynamic>> getUserDynamicDataByUser(int uId) async =>
      _dbProvider.getUserDynamicDataByUser(uId);

  // USER FOLLOWING DYNAMIC ============================================================================================
  @override
  Future<List<UserFollowingDynamic>> getUserFollowingDynamicDataByUser(
          int uId) async =>
      _dbProvider.getUserFollowingDynamicDataByUser(uId);

  // USER LIKING DYNAMIC ===============================================================================================
  @override
  Future<List<UserLikingDynamic>> getUserLikingDynamicDataByUser(
          int uId) async =>
      _dbProvider.getUserLikingDynamicDataByUser(uId);

  // XXXXXXXXXXXXXXXXXXX ===============================================================================================
  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset(
              int createdActivityId, int offset) async =>
          _dbProvider
              .getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset(
                  createdActivityId, offset);

  @override
  Future<List<ConsistedActivityDynamicWithDistance>>
      getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess(
              int createdActivityId, int offset) async =>
          _dbProvider
              .getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess(
                  createdActivityId, offset);

  @override
  Future<List<ConsistedActivityDynamic>>
      getConsistedActivityDynamicDataByCreatedActivityAttendee(
              int createdActivityId, int attendeeId) async =>
          _dbProvider.getConsistedActivityDynamicDataByCreatedActivityAttendee(
              createdActivityId, attendeeId);

  @override
  Future<List<CreatedActivityDynamic>>
      getCreatedActivityDynamicDataByChosenAttributes(
              int activityNameId, int hostId) async =>
          _dbProvider.getCreatedActivityDynamicDataByChosenAttributes(
              activityNameId, hostId);

  @override
  Future<List<TrainingDetailDynamic>>
      getTrainingDetailDynamicDataByChosenAttributes(
              int activityNameId) async =>
          _dbProvider
              .getTrainingDetailDynamicDataByChosenAttributes(activityNameId);

  @override
  Future<List<TrainingOfferDynamic>>
      getTrainingOfferDynamicDataByChosenAttributes(int coachId,
              int trainingDetailId, int coachingLocationDetailId) async =>
          _dbProvider.getTrainingOfferDynamicDataByChosenAttributes(
              coachId, trainingDetailId, coachingLocationDetailId);

  @override
  Future<List<TrainingRequestDynamic>>
      getTrainingRequestDynamicDataByChosenAttributes(int trainingRequesterId,
              int trainingDetailId, int locationDetailId) async =>
          _dbProvider.getTrainingRequestDynamicDataByChosenAttributes(
              trainingRequesterId, trainingDetailId, locationDetailId);

  @override
  Future<List<TrainingOfferResponseDynamic>>
      getTrainingOfferResponseDynamicDataByChosenAttributes(
              int trainingOfferId, int traineeId) async =>
          _dbProvider.getTrainingOfferResponseDynamicDataByChosenAttributes(
              trainingOfferId, traineeId);

  @override
  Future<List<TrainingRequestResponseDynamic>>
      getTrainingRequestResponseDynamicDataByChosenAttributes(
              int trainingRequestId, int coachId) async =>
          _dbProvider.getTrainingRequestResponseDynamicDataByChosenAttributes(
              trainingRequestId, coachId);

  @override
  Future<List<ActivityConversationDynamic>>
      getActivityConversationDynamicDataByChosenAttributes(
              int consistedActivityId) async =>
          _dbProvider.getActivityConversationDynamicDataByChosenAttributes(
              consistedActivityId);

  @override
  Future<List<TrainingRequestConversationDynamic>>
      getTrainingRequestConversationDynamicDataByChosenAttributes(
              int trainingRequestResponseId) async =>
          _dbProvider
              .getTrainingRequestConversationDynamicDataByChosenAttributes(
                  trainingRequestResponseId);

  @override
  Future<List<TrainingOfferConversationDynamic>>
      getTrainingOfferConversationDynamicDataByChosenAttributes(
              int trainingOfferResponseId) async =>
          _dbProvider.getTrainingOfferConversationDynamicDataByChosenAttributes(
              trainingOfferResponseId);

  @override
  Future<List<ContentNumber?>> getAttendedActivityDataByAttendee(
          int attendeeId) async =>
      _dbProvider.getAttendedActivityDataByAttendee(attendeeId);

  @override
  Future<List<CreatedActivityDynamic>> getCreatedActivityDynamicDataByHost(
          int hostId, int offset) async =>
      _dbProvider.getCreatedActivityDynamicDataByHost(hostId, offset);

  @override
  Future<List<ActivityTile>> getResultOfPreferredActivityDynamicData(
    int id,
    String activityTitle,
    double locationCircularDiamter,
    double lat,
    double lon,
    int offset,
  ) async =>
      _dbProvider.getResultOfPreferredActivityDynamicData(
          id, activityTitle, locationCircularDiamter, lat, lon, offset);

  // POST ==============================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ===================================================================================================================
  // ACTIVITY TEMPLATE =================================================================================================
  // Activity Detail Dynamic (reading for posting) =====================================================================
  @override
  Future<List<ActivityNameDynamic>> getActivityNameDynamicByChosenAttributes(
          int activityNameId) async =>
      _dbProvider.getActivityNameDynamicByChosenAttributes(activityNameId);

  // Activity Template (for posting) ===================================================================================
  @override
  Future<List<DBStatus>> postActivityTemplate(
          ActivityTemplate activityTemplate) async =>
      _dbProvider.postActivityTemplate(activityTemplate);

  // Activity Template (for puting) ====================================================================================
  @override
  Future<List<DBStatus>> putActivityTemplate(
          ActivityTemplate activityTemplate) async =>
      _dbProvider.putActivityTemplate(activityTemplate);

  // Activity Template (for puting) ====================================================================================
  @override
  Future<List<DBStatus>> deleteActivityTemplate(int activityTemplateId) async =>
      _dbProvider.deleteActivityTemplate(activityTemplateId);

  // USER ==============================================================================================================
  // Country City Dynamic (reading for posting) ========================================================================
  @override
  Future<List<CountryCityDynamic>> getCountryCityDynamicByChosenAttributes(
          int cityId, int countryId) async =>
      _dbProvider.getCountryCityDynamicByChosenAttributes(cityId, countryId);

  // User (for posting) ===============================================================================================
  @override
  Future<List<DBStatus>> putUser(UserDB userDB) async =>
      _dbProvider.putUser(userDB);

  // COACH =============================================================================================================
  // Coaching Experience Dynamic (reading for posting) =================================================================
  @override
  Future<List<CoachingExperienceDynamic>>
      getCoachingExperienceDynamicByChosenAttributes(
              int coachingExperienceYearId) async =>
          _dbProvider.getCoachingExperienceDynamicByChosenAttributes(
              coachingExperienceYearId);

  // User (for posting) ===============================================================================================
  @override
  Future<List<DBStatus>> putCoach(CoachDB coachDB) async =>
      _dbProvider.putCoach(coachDB);

  // LOCATION TEMPLATE =================================================================================================
  // Location Detail Dynamic (reading for posting) =====================================================================
  @override
  Future<List<LocationDetailDynamic>>
      getLocationDetailDynamicByChosenAttributes(
              double prefferedLocationCircularDiameter,
              double membershipMaxDiameter,
              double lat,
              double lon) async =>
          _dbProvider.getLocationDetailDynamicByChosenAttributes(
              prefferedLocationCircularDiameter,
              membershipMaxDiameter,
              lat,
              lon);

  // Location Template (for posting) ===================================================================================
  @override
  Future<List<DBStatus>> postLocationTemplate(
          LocationTemplate locationTemplate) async =>
      _dbProvider.postLocationTemplate(locationTemplate);

  // Location Template (for puting) ====================================================================================
  @override
  Future<List<DBStatus>> putLocationTemplate(
          LocationTemplate locationTemplate) async =>
      _dbProvider.putLocationTemplate(locationTemplate);

  // Location Template (for deleting) ==================================================================================
  @override
  Future<List<DBStatus>> deleteLocationTemplate(int locationTemplateId) async =>
      _dbProvider.deleteLocationTemplate(locationTemplateId);

  // Location Detail (for posting) =====================================================================================
  @override
  Future<List<DBStatus>> postLocationDetail(
          LocationDetail locationDetail) async =>
      _dbProvider.postLocationDetail(locationDetail);

  // CREATED ACTIVITY ==================================================================================================
  // Created Activity (for posting) ====================================================================================
  @override
  Future<List<DBStatus>> postCreatedActivity(
          CreatedActivity createdActivity) async =>
      _dbProvider.postCreatedActivity(createdActivity);

  // Created Activity (for puting) =====================================================================================
  @override
  Future<List<DBStatus>> putCreatedActivity(
          CreatedActivity createdActivity) async =>
      _dbProvider.putCreatedActivity(createdActivity);

  // Created Activity (for deleting) ===================================================================================
  @override
  Future<List<DBStatus>> deleteCreatedActivity(int createdActivityId) async =>
      _dbProvider.deleteCreatedActivity(createdActivityId);

  // CONSISTED ACTIVITY ================================================================================================
  // Consisted Activity (for posting) ==================================================================================
  @override
  Future<List<DBStatus>> postConsistedActivity(
          ConsistedActivity consistedActivity) async =>
      _dbProvider.postConsistedActivity(consistedActivity);

  // Consisted Activity (for puting) ===================================================================================
  @override
  Future<List<DBStatus>> putConsistedActivity(
          ConsistedActivity consistedActivity) async =>
      _dbProvider.putConsistedActivity(consistedActivity);

  // Consisted Activity (for deleting) =================================================================================
  @override
  Future<List<DBStatus>> deleteConsistedActivity(
          int consistedActivityId) async =>
      _dbProvider.deleteConsistedActivity(consistedActivityId);

  // TRAINING OFFER ====================================================================================================
  // Training Offer (for posting) ====================================================================================
  @override
  Future<List<DBStatus>> postTrainingOffer(TrainingOffer trainingOffer) async =>
      _dbProvider.postTrainingOffer(trainingOffer);

  // Training Offer (for puting) =======================================================================================
  @override
  Future<List<DBStatus>> putTrainingOffer(TrainingOffer trainingOffer) async =>
      _dbProvider.putTrainingOffer(trainingOffer);

  // Training Offer (for deleting) =====================================================================================
  @override
  Future<List<DBStatus>> deleteTrainingOffer(int trainingOfferId) async =>
      _dbProvider.deleteTrainingOffer(trainingOfferId);

  // TRAINING OFFER RESPONSE =========================================================================================
  // Training Offer Response (for posting) =============================================================================
  @override
  Future<List<DBStatus>> postTrainingOfferResponse(
          TrainingOfferResponse trainingOfferResponse) async =>
      _dbProvider.postTrainingOfferResponse(trainingOfferResponse);

  // Training Offer Response (for puting) ==============================================================================
  @override
  Future<List<DBStatus>> putTrainingOfferResponse(
          TrainingOfferResponse trainingOfferResponse) async =>
      _dbProvider.putTrainingOfferResponse(trainingOfferResponse);

  // Training Offer Response (for deleting) ============================================================================
  @override
  Future<List<DBStatus>> deleteTrainingOfferResponse(
          int trainingOfferResponseId) async =>
      _dbProvider.deleteTrainingOfferResponse(trainingOfferResponseId);

  // TRAINING REQUEST ==================================================================================================
  // Training Request (for posting) ====================================================================================
  @override
  Future<List<DBStatus>> postTrainingRequest(
          TrainingRequest trainingRequest) async =>
      _dbProvider.postTrainingRequest(trainingRequest);

  // Training Request (for puting) =====================================================================================
  @override
  Future<List<DBStatus>> putTrainingRequest(
          TrainingRequest trainingRequest) async =>
      _dbProvider.putTrainingRequest(trainingRequest);

  // Training Request (for deleting) ===================================================================================
  @override
  Future<List<DBStatus>> deleteTrainingRequest(int trainingRequestId) async =>
      _dbProvider.deleteTrainingRequest(trainingRequestId);

  // TRAINING REQUEST RESPONSE ===================================================================================
  // Training Request Response (for posting) ===========================================================================
  @override
  Future<List<DBStatus>> postTrainingRequestResponse(
          TrainingRequestResponse trainingRequestResponse) async =>
      _dbProvider.postTrainingRequestResponse(trainingRequestResponse);

  // Training Request Response (for puting) ============================================================================
  @override
  Future<List<DBStatus>> putTrainingRequestResponse(
          TrainingRequestResponse trainingRequestResponse) async =>
      _dbProvider.putTrainingRequestResponse(trainingRequestResponse);

  // Training Request Response (for deleting) ==========================================================================
  @override
  Future<List<DBStatus>> deleteTrainingRequestResponse(
          int trainingRequestResponseId) async =>
      _dbProvider.deleteTrainingRequestResponse(trainingRequestResponseId);

  // ACTIVITY CONVERSATION =============================================================================================
  // Activity Conversation (for posting) ===============================================================================
  @override
  Future<List<DBStatus>> postActivityConversation(
          ActivityConversation activityConversation) async =>
      _dbProvider.postActivityConversation(activityConversation);

  // Activity Conversation (for puting) ================================================================================
  @override
  Future<List<DBStatus>> putActivityConversation(
          ActivityConversation activityConversation) async =>
      _dbProvider.putActivityConversation(activityConversation);

  // Activity Conversation (for deleting) ==============================================================================
  @override
  Future<List<DBStatus>> deleteActivityConversation(
          int activityConversationId) async =>
      _dbProvider.deleteActivityConversation(activityConversationId);

  // TRAINING REQUEST CONVERSATION =====================================================================================
  // Training Request Conversation (for posting) =======================================================================
  @override
  Future<List<DBStatus>> postTrainingRequestConversation(
          TrainingRequestConversation trainingRequestConversation) async =>
      _dbProvider.postTrainingRequestConversation(trainingRequestConversation);

  // Training Request Conversation (for puting) ========================================================================
  @override
  Future<List<DBStatus>> putTrainingRequestConversation(
          TrainingRequestConversation trainingRequestConversation) async =>
      _dbProvider.putTrainingRequestConversation(trainingRequestConversation);

  // Training Request Conversation (for deleting) ======================================================================
  @override
  Future<List<DBStatus>> deleteTrainingRequestConversation(
          int trainingRequestConversationId) async =>
      _dbProvider
          .deleteTrainingRequestConversation(trainingRequestConversationId);

  // TRAINING OFFER CONVERSATION =======================================================================================
  // Training Offer Conversation (for posting) =========================================================================
  @override
  Future<List<DBStatus>> postTrainingOfferConversation(
          TrainingOfferConversation trainingOfferConversation) async =>
      _dbProvider.postTrainingOfferConversation(trainingOfferConversation);

  // Training Offer Conversation (for puting) ==========================================================================
  @override
  Future<List<DBStatus>> putTrainingOfferConversation(
          TrainingOfferConversation trainingOfferConversation) async =>
      _dbProvider.putTrainingOfferConversation(trainingOfferConversation);

  // Training Offer Conversation (for deleting) ========================================================================
  @override
  Future<List<DBStatus>> deleteTrainingOfferConversation(
          int trainingOfferConversationId) async =>
      _dbProvider.deleteTrainingOfferConversation(trainingOfferConversationId);
}




  // // NUMBER OF ACTIVITIES ==============================================================================================
  // @override
  // Future<List<DetailNumber>> getNumberOfActivitiesByActivityName(int uId,
  //         String activityDate, List<String> activityTypeDetailList) async =>
  //     _dbProvider.getNumberOfActivitiesByActivityName(
  //         uId, activityDate, activityTypeDetailList);

  // @override
  // Future<List<DetailNumber>> getNumberOfActivitiesByActivityType(
  //         int uId, String activityDate) async =>
  //     _dbProvider.getNumberOfActivitiesByActivityType(uId, activityDate);

  // @override
  // Future<List<int>?> getNumberOfActivitiesByDate(
  //         int uId, String activityDate) async =>
  //     _dbProvider.getNumberOfActivitiesByDate(uId, activityDate);