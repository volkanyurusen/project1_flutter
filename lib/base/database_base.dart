import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/models/models.dart';

abstract class DatabaseBase {
  /// ACTIVIY CONVERSATION DYNAMIC =====================================================================================
  Future<List<dynamic>> getActivityConversationDynamicDataByUser(
      int uId, int offset);

  /// ACTIVIY MESSAGE DYNAMIC ==========================================================================================
  Future<List<dynamic>> getActivityMessageDynamicDataByUser(int uId);

  Future<List<dynamic>> getMessageDynamicDataByGroupOfActivityConversation(
      int uId, int offset);

  Future<List<dynamic>> getMessageDynamicDataByActivityConversation(
      int createdActivityId, int offset);

  /// ACTIVITY NAME DYNAMIC ============================================================================================
  Future<List<dynamic>> getAllActivityNameDynamicData();

  Future<List<dynamic>> getActivityNameDynamicDataByActivityType(
      List<String> activityTypeList);

  /// ACTIVIY TEMPLATE DYNAMIC =========================================================================================
  Future<List<dynamic>> getActivityTemplateDynamicDataByUser(
      int uId, int offset);

  /// ACTIVITY TYPE DYNAMIC ============================================================================================
  Future<List<dynamic>> getAllActivityTypeDynamicData();

  /// CITY DYNAMIC =====================================================================================================
  Future<List<dynamic>> getCityDynamicDataByCountry(String countryDetail);

  /// COACH  ===========================================================================================================
  Future<List<dynamic>> getCoachData(int coachId);

  /// COACH DYNAMIC ====================================================================================================
  Future<List<dynamic>> getCoachDynamicData(int coachId);

  /// COACHING EXPERIENCE DYNAMIC ======================================================================================
  Future<List<dynamic>> getAllCoachingExperienceDynamicData();

  /// COACHING TYPE ====================================================================================================
  Future<List<dynamic>> getAllCoachingTypeData();

  /// CONSISTED ACTIVITY DYNAMIC =======================================================================================
  Future<List<dynamic>>
      getConsistedActivityDynamicWithDistanceDataAttendedByUser(
          int uId, int offset);

  Future<List<dynamic>> getConsistedActivityDynamicWithDistanceDataByUser(
      int uId);

  Future<List<dynamic>>
      getConsistedActivityDynamicWithDistanceDataCreatedByUser(
          int createdActivityId);

  /// COUNTRY CITY DYNAMIC =============================================================================================
  Future<List<dynamic>> getCountryCityDynamicDataById(int countryCityId);

  /// COUNTRY DYNAMIC ==================================================================================================
  Future<List<dynamic>> getAllCountryDynamicData();

  /// CREATED ACTIVITY DYNAMIC =========================================================================================
  Future<List<dynamic>> getCreatedActivityDynamicWithDistanceDataCreatedByUser(
      int uId, int offset);

  /// GENDER DYNAMIC ===================================================================================================
  Future<List<dynamic>> getAllGenderDynamicData();

  /// LOCATION TEMPLATE DYNAMIC ========================================================================================
  Future<List<dynamic>> getLocationTemplateDynamicDataByUser(
      int uId, int offset);

  /// MEMBERSHIP TYPE ==================================================================================================
  Future<List<dynamic>> getAllMembershipTypeData();

  /// MEMBERSHIP TYPE ==================================================================================================
  Future<List<dynamic>> getAllProcessDetailDynamicData();

  /// RECENT ACTIVITY ==================================================================================================
  Future<List<dynamic>> getRecentActivityDataByUser(int uId);

  /// RESULT OF CHOSEN ACTIVITY DYNAMIC ================================================================================
  Future<List<dynamic>> getResultOfChosenActivityDynamicData(
      int uId,
      List activityTypeDetailList,
      List activityTitleList,
      double locationCircularDiamter,
      double lat,
      double lon,
      int offset);

  /// TRAINING OFFER CONVERSATION DYNAMIC ==============================================================================
  Future<List<dynamic>> getTrainingOfferConversationDynamicDataByUser(
      int uId, int offset);

  Future<List<dynamic>> getFindACoachConversationDynamicDataByTrainee(
      int traineeId, int offset);

  /// TRAINING OFFER DYNAMIC ===========================================================================================
  Future<List<dynamic>> getTrainingOfferDynamicDataOfferedByCoach(
      int coachId, int offset);

  /// TRAINING OFFER DYNAMIC WITH DISTANCE =============================================================================
  Future<List<dynamic>> getTrainingOfferDynamicWithDistanceDataByUser(
      int uId, String activityTitle, int offset);

  /// TRAINING OFFER MESSAGE DYNAMIC ===================================================================================
  Future<List<dynamic>> getTrainingOfferMessageDynamicDataByUser(int uId);

  Future<List<dynamic>>
      getTrainingOfferMessageDynamicDataByGroupOfTrainingOfferConversation(
          int uId, List<int> trainingOfferConversationList);

  Future<List<dynamic>>
      getTrainingOfferMessageDynamicDataByTrainingOfferConversation(
          int uId, int trainingOfferConversationId, int offset);

  Future<List<dynamic>>
      getFindACoachMessageDynamicDataByGroupOfFindACoachConversation(
          int traineeId, List<int> findACoachConversationList);

  Future<List<dynamic>> getFindACoachMessageDynamicDataByFindACoachConversation(
      int traineeId, int findACoachConversationId, int offset);

  /// TRAINING OFFER RESPONSE DYNAMIC ==================================================================================
  Future<List<dynamic>> getTrainingOfferResponseDynamicDataRespondedByTrainee(
      int traineeId, int offset);

  /// TRAINING OFFER RESPONSE DYNAMIC WITH DISTANCE ====================================================================
  Future<List<dynamic>>
      getTrainingOfferResponseDynamicWithDistanceDataByTrainingOffer(
          int trainingOfferId, int offset);

  Future<List<dynamic>>
      getTrainingOfferResponseDynamicWithDistanceDataOfChosenActivityByTrainee(
          int traineeId, int activityNameId, int offset);

  Future<List<dynamic>>
      getTrainingOfferResponseDynamicWithDistanceDataByChosenAttributes(
          String activityTitle, int userId);

  /// TRAINING REQUEST CONVERSATION DYNAMIC ============================================================================
  Future<List<dynamic>> getTrainingRequestConversationDynamicDataByUser(
      int uId, int offset);

  /// TRAINING REQUEST DYNAMIC =========================================================================================
  Future<List<dynamic>> getTrainingRequestDynamicDataRequestedByUser(
      int uId, int offset);

  /// TRAINING REQUEST DYNAMIC WITH DISTANCE ===========================================================================
  Future<List<dynamic>> getTrainingRequestDynamicWithDistanceDataByUser(
      int uId, String activityTitle, int offset);

  /// TRAINING REQUEST MESSAGE DYNAMIC =================================================================================
  Future<List<dynamic>>
      getTrainingRequestMessageDynamicDataByGroupOfTrainingRequestConversation(
          int uId, List<int> trainingRequestConversationList);

  Future<List<dynamic>>
      getTrainingRequestMessageDynamicDataByTrainingRequestConversation(
          int uId, int trainingRequestConversationId, int offset);

  /// TRAINING REQUEST RESPONSE DYNAMIC WITH DISTANCE ==================================================================
  Future<List<dynamic>>
      getTrainingRequestResponseDynamicWithDistanceDataByTrainingRequest(
          int trainingRequestId, int offset);

  Future<List<dynamic>>
      getTrainingRequestResponseDynamicWithDistanceDataByChosenAttributes(
          String activityTitle, int coachId);

  /// USER =============================================================================================================
  Future<List<dynamic>> getUserDataByUser(int uId);

  /// USER DYNAMIC =====================================================================================================
  Future<List<dynamic>> getUserDynamicDataByUser(int uId);

  /// USER FOLLOWING DYNAMIC ===========================================================================================
  Future<List<dynamic>> getUserFollowingDynamicDataByUser(int uId);

  /// USER LIKING DYNAMIC ==============================================================================================
  Future<List<dynamic>> getUserLikingDynamicDataByUser(int uId);

  /// XXXXXXXXXXXXXXXXXXX ==============================================================================================
  Future<List<dynamic>>
      getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffset(
          int createActivityId, int offset);

  Future<List<dynamic>>
      getConsistedActivityDynamicWithDistanceDataByCreatedActivityWithOffsetAndProcess(
          int createActivityId, int offset);

  Future<List<dynamic>>
      getConsistedActivityDynamicDataByCreatedActivityAttendee(
          int createActivityId, int attendeeId);

  Future<List<dynamic>> getCreatedActivityDynamicDataByChosenAttributes(
      int activityNameId, int hostId);

  Future<List<dynamic>> getTrainingDetailDynamicDataByChosenAttributes(
      int activityNameId);

  Future<List<dynamic>> getTrainingOfferDynamicDataByChosenAttributes(
      int coachId, int trainingDetailId, int coachingLocationDetailId);

  Future<List<dynamic>> getTrainingRequestDynamicDataByChosenAttributes(
      int trainingRequesterId, int trainingDetailId, int locationDetailId);

  Future<List<dynamic>> getTrainingOfferResponseDynamicDataByChosenAttributes(
      int trainingOfferId, int traineeId);

  Future<List<dynamic>> getTrainingRequestResponseDynamicDataByChosenAttributes(
      int trainingRequestId, int coachId);

  Future<List<dynamic>> getActivityConversationDynamicDataByChosenAttributes(
      int consistedActivityId);

  Future<List<dynamic>>
      getTrainingRequestConversationDynamicDataByChosenAttributes(
          int trainingRequestResponseId);

  Future<List<dynamic>>
      getTrainingOfferConversationDynamicDataByChosenAttributes(
          int trainingOfferResponseId);

  Future<List<dynamic>> getAttendedActivityDataByAttendee(int attendeeId);

  Future<List<dynamic>> getCreatedActivityDynamicDataByHost(
      int hostId, int offset);

  /// RESULT OF PREFERED ACTIVITY DYNAMIC ==============================================================================
  Future<List<dynamic>> getResultOfPreferredActivityDynamicData(
      int uId,
      String activityTitle,
      double locationCircularDiamter,
      double lat,
      double lon,
      int offset);

  /// POST =============================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ACTIVITY TEMPLATE ================================================================================================
  /// Activity Name Dynamic (reading for posting) ====================================================================
  Future<List<dynamic>> getActivityNameDynamicByChosenAttributes(
      int activityNameId);

  /// Activity Template (for posting) ==================================================================================
  Future<List<dynamic>> postActivityTemplate(ActivityTemplate activityTemplate);

  /// Activity Template (for putting) ==================================================================================
  Future<List<dynamic>> putActivityTemplate(ActivityTemplate activityTemplate);

  /// Activity Template (for deleting) =================================================================================
  Future<List<dynamic>> deleteActivityTemplate(int activityTemplateId);

  /// USER =============================================================================================================
  /// Activity Detail Dynamic (reading for posting) ====================================================================
  Future<List<dynamic>> getCountryCityDynamicByChosenAttributes(
      int cityId, int countryId);

  /// User (for putting) ===============================================================================================
  Future<List<dynamic>> putUser(UserDB userDB);

  /// COACH ============================================================================================================
  /// Coaching Experience Dynamic (reading for posting) ================================================================
  Future<List<dynamic>> getCoachingExperienceDynamicByChosenAttributes(
      int coachingExperienceId);

  /// Coach (for putting) ==============================================================================================
  Future<List<dynamic>> putCoach(CoachDB coachDB);

  /// LOCATION TEMPLATE ================================================================================================
  /// Location Detail Dynamic (reading for posting) ====================================================================
  Future<List<dynamic>> getLocationDetailDynamicByChosenAttributes(
    double prefferedLocationCircularDiameter,
    double membershipMaxDiameter,
    double lat,
    double lon,
  );

  /// Location Template (for posting) ==================================================================================
  Future<List<dynamic>> postLocationTemplate(LocationTemplate locationTemplate);

  /// Location Template (for putting) ==================================================================================
  Future<List<dynamic>> putLocationTemplate(LocationTemplate locationTemplate);

  /// Location Template (for deleting) =================================================================================
  Future<List<dynamic>> deleteLocationTemplate(int locationTemplateId);

  /// Location Detail (for posting) ====================================================================================
  Future<List<dynamic>> postLocationDetail(LocationDetail locationDetail);

  /// CREATED ACTIVITY =================================================================================================
  /// Created Activity (for posting) ===================================================================================
  Future<List<dynamic>> postCreatedActivity(CreatedActivity createdActivity);

  /// Created Activity (for putting) ===================================================================================
  Future<List<dynamic>> putCreatedActivity(CreatedActivity createdActivity);

  /// Created Activity (for deleting) ==================================================================================
  Future<List<dynamic>> deleteCreatedActivity(int createdActivityId);

  /// CONSISTED ACTIVITY ===============================================================================================
  /// Consisted Activity (for posting) =================================================================================
  Future<List<dynamic>> postConsistedActivity(
      ConsistedActivity consistedActivity);

  /// Consisted Activity (for putting) =================================================================================
  Future<List<dynamic>> putConsistedActivity(
      ConsistedActivity consistedActivity);

  /// Consisted Activity (for deleting) ================================================================================
  Future<List<dynamic>> deleteConsistedActivity(int consistedActivityId);

  /// TRAINING OFFER ===================================================================================================
  /// Training Offer (for posting) =====================================================================================
  Future<List<dynamic>> postTrainingOffer(TrainingOffer trainingOffer);

  /// Training Offer (for putting) ====================================================================================
  Future<List<dynamic>> putTrainingOffer(TrainingOffer trainingOffer);

  /// Training Offer (for deleting) ==================================================================================
  Future<List<dynamic>> deleteTrainingOffer(int trainingOffer);

  /// TRAINING OFFER RESPONSE ==========================================================================================
  /// Training Offer Response (for posting) ============================================================================
  Future<List<dynamic>> postTrainingOfferResponse(
      TrainingOfferResponse trainingOfferResponse);

  /// Training Offer Response (for putting) ============================================================================
  Future<List<dynamic>> putTrainingOfferResponse(
      TrainingOfferResponse trainingOfferResponse);

  /// Training Offer Response (for deleting) ===========================================================================
  Future<List<dynamic>> deleteTrainingOfferResponse(
      int trainingOfferResponseId);

  /// TRAINING REQUEST =================================================================================================
  /// Training Request (for posting) ===================================================================================
  Future<List<dynamic>> postTrainingRequest(TrainingRequest trainingRequest);

  /// Training Request (for putting) ===================================================================================
  Future<List<dynamic>> putTrainingRequest(TrainingRequest trainingRequest);

  /// Training Request (for deleting) ==================================================================================
  Future<List<dynamic>> deleteTrainingRequest(int trainingRequest);

  /// TRAINING REQUEST RESPONSE ========================================================================================
  /// Training Request Response (for posting) ==========================================================================
  Future<List<dynamic>> postTrainingRequestResponse(
      TrainingRequestResponse trainingRequestResponse);

  /// Training Request Response (for putting) ==========================================================================
  Future<List<dynamic>> putTrainingRequestResponse(
      TrainingRequestResponse trainingRequestResponse);

  /// Training Request Response (for deleting) =========================================================================
  Future<List<dynamic>> deleteTrainingRequestResponse(
      int trainingRequestResponseId);

  /// ACTIVITY CONVERSATION ============================================================================================
  /// Activity Conversation (for posting) ==============================================================================
  Future<List<dynamic>> postActivityConversation(
      ActivityConversation activityConversation);

  /// Activity Conversation (for putting) ==============================================================================
  Future<List<dynamic>> putActivityConversation(
      ActivityConversation activityConversation);

  /// Activity Conversation (for deleting) =============================================================================
  Future<List<dynamic>> deleteActivityConversation(int activityConversationId);

  /// TRAINING REQUEST CONVERSATION ====================================================================================
  /// Training Request (for posting) ===================================================================================
  Future<List<dynamic>> postTrainingRequestConversation(
      TrainingRequestConversation trainingRequestConversation);

  /// Training Request (for putting) ===================================================================================
  Future<List<dynamic>> putTrainingRequestConversation(
      TrainingRequestConversation trainingRequestConversation);

  /// Training Request (for deleting) ==================================================================================
  Future<List<dynamic>> deleteTrainingRequestConversation(
      int trainingRequestConversationId);

  /// TRAINING OFFER CONVERSATION ======================================================================================
  /// Training Offer (for posting) =====================================================================================
  Future<List<dynamic>> postTrainingOfferConversation(
      TrainingOfferConversation trainingOfferConversation);

  /// Training Offer (for putting) =====================================================================================
  Future<List<dynamic>> putTrainingOfferConversation(
      TrainingOfferConversation trainingOfferConversation);

  /// Training Offer (for deleting) ====================================================================================
  Future<List<dynamic>> deleteTrainingOfferConversation(
      int trainingOfferConversationId);
}



  // Future<List<dynamic>> getNumberOfActivitiesByActivityName(
  //     int uId, String activityDate, List<String> activityTypeDetailList);

  // Future<List<dynamic>> getNumberOfActivitiesByActivityType(
  //     int uId, String activityDate);

  // Future<List<dynamic>?> getNumberOfActivitiesByDate(
  //     int uId, String activityDate);
