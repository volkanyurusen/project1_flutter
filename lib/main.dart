import 'package:flutter/material.dart';
import 'package:my_project/auth/logic/blocs.dart';
import 'package:my_project/auth/repository/auth_repository.dart';
import 'package:my_project/config/app_router.dart';
import 'package:my_project/config/theme.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/navigation/zscreens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: MultiBlocProvider(
        providers: [
          /// AuthenticationBloc (It has not completed yet)
          BlocProvider(
              create: (context) =>
                  LoginBloc(authRepository: context.read<AuthRepository>())),

          /// NAVIGATION BLOCS =========================================================================================
          /// ==========================================================================================================
          /// Page Index -----------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => IndexOfPageCubit()),

          BlocProvider(create: (context) => IndexOfDiscoverTabCubit()),

          BlocProvider(create: (context) => IndexOfExistenceTabCubit()),

          BlocProvider(create: (context) => IndexOfMessageTabCubit()),

          BlocProvider(create: (context) => IndexOfCoachingUserTabCubit()),

          BlocProvider(create: (context) => IndexOfCoachingCoachTabCubit()),

          /// SEARCH SCREEN BLOCS ======================================================================================
          /// ==========================================================================================================
          /// Recent Activtities ---------------------------------------------------------------------------------------
          BlocProvider(create: (context) => RecentActivityBloc()),
          // ..add(LoadRecentActivityEvent(
          //     uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) => SearchActivityByChosenRecentActivityCubit()),

          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => ActivityTypeDynamicBloc()),
          // ..add(LoadActivityTypeDynamicEvent())),

          BlocProvider(create: (context) => ActivityTypeDynamicButtonBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => ActivityNameButtonCubit()),
          BlocProvider(
              create: (context) =>
                  ChosenActivityNameInActivityPreferencesCubit()),

          BlocProvider(
              create: (context) => ActivityNameDynamicByActivityTypeBloc(
                  activityTypeDynamicButtonBloc:
                      context.read<ActivityTypeDynamicButtonBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicButtonCubit()),

          BlocProvider(create: (context) => ActivityNameDynamicBloc()),
          // ..add(LoadActivityNameDynamicEvent())),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => CleanAllButtonCubit()),

          /// Show Result ----------------------------------------------------------------------------------------------
          // BlocProvider(create: (context) => ShowResultButtonCubit()),

          /// Result Of Chosen Activities
          BlocProvider(
              create: (context) => ResultOfChosenActivityDynamicBloc()),

          /// RESULT SCREEN BLOCS ======================================================================================
          /// ==========================================================================================================
          /// Chosen Result Of Chosen Activities -----------------------------------------------------------------------
          BlocProvider(
              create: (context) => ChosenResultOfChosenActivityDynamicCubit()),

          /// User Likes -----------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => UserLikingDynamicByUserBloc()),

          // User Following --------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => UserFollowingDynamicByUserBloc()),

          // ConsistedActivity With Distance ---------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ConsistedActivityDynamicWithDistanceByUserBloc()),

          /// CREATE ACTIVITY SCREEN BLOCS =============================================================================
          /// ==========================================================================================================
          /// Activity Templates ---------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => ActivityTemplateDynamicByUserBloc()),
          // ..add(LoadActivityTemplateDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  CreateActivityByChosenActivityTemplateDynamicCubit()),

          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnCreateActivityScreenBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnCreateActivityScreenBloc(
                      activityTypeDynamicButtonOnCreateActivityScreenBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnCreateActivityScreenBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicButtonOnCreateActivityScreenCubit()),

          /// Time Periods ---------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  TimePeriodDynamicButtonOnCreateActivityScreenCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => CleanAllButtonOnCreateActivityScreenCubit()),

          /// ATTENDANCE PAGE BLOCS ====================================================================================
          /// ==========================================================================================================
          /// Consisted Activities -------------------------------------------------------------------------------------
          BlocProvider(
            create: (context) =>
                ConsistedActivityDynamicWithDistanceAttendedByUserBloc(),
          ),
          // ..add(
          //     LoadConsistedActivityDynamicWithDistanceAttendedByUserEvent(
          //         uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit()),

          /// CHOSEN CONSISTED ACTIVITY SCREEN =========================================================================
          /// ==========================================================================================================
          /// Chosen Attendees -----------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ChosenAttendeeOnAttendanceAmongThoseWhoSentRequestCubit()),

          /// TEMPLATE PAGE BLOCS ======================================================================================
          /// ==========================================================================================================
          /// Location Templates ---------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => LocationTemplateDynamicByUserBloc()),
          // ..add(LoadLocationTemplateDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId))),

          /// LOCATION TEMPLATE AREA ===================================================================================
          /// ==========================================================================================================
          BlocProvider(
              create: (context) =>
                  ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit()),

          /// CREATION PAGE BLOCS ======================================================================================
          /// ==========================================================================================================
          /// Created Activities ---------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  CreatedActivityDynamicWithDistanceCreatedByUserBloc()),
          // ..add(
          //     LoadCreatedActivityDynamicWithDistanceCreatedByUserEvent(
          //         uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit()),

          /// Consisted Activities -------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ConsistedActivityDynamicWithDistanceByCreatedActivityBloc()),

          /// CHOSEN CREATED ACTIVITY SCREEN ===========================================================================
          /// ==========================================================================================================
          /// Chosen Attendees -----------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ChosenAttendeeOnCreationAmongThoseWhoSentRequestCubit()),

          /// ACTIVITY TEMPLATE AREA ===================================================================================
          /// ==========================================================================================================

          /// ACTIVITY TEMPLATE UPDATING POP UP ========================================================================
          /// ==========================================================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc(
                      activityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit()),

          /// Time Periods --------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  TimePeriodDynamicButtonOnActivityTemplateUpdatingPopUpCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  CleanAllButtonOnActivityTemplateUpdatingPopUpCubit()),

          /// Chosen Template ------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit()),

          /// ACTIVITY TEMPLATE ADDING POP UP ==========================================================================
          /// ==========================================================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc(
                      activityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit()),

          /// Time Periods ---------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  TimePeriodDynamicButtonOnActivityTemplateAddingPopUpCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  CleanAllButtonOnActivityTemplateAddingPopUpCubit()),

          /// Chosen Template ------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpCubit()),

          /// TRAINING REQUEST AREA ====================================================================================
          /// ==========================================================================================================
          /// Training Request -----------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => TrainingRequestDynamicRequestedByUserBloc()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingRequestAmongTrainingRequestDynamicOfUserCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit()),

          /// TRAINING REQUEST UPDATING POP UP =========================================================================
          /// ==========================================================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpBloc()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  CleanAllButtonOnTrainingRequestUpdatingPopUpCubit()),

          /// TRAINING REQUEST ADDING POP UP ===========================================================================
          /// ==========================================================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpBloc(
                      activityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  CleanAllButtonOnTrainingRequestAddingPopUpCubit()),

          /// HOST SCREEN ==============================================================================================
          /// ==========================================================================================================
          /// Consisted Activities -------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => ChosenHostWhoCreatedActivityCubit()),

          /// TRAINING REQUEST RESPONSE AREA ===========================================================================
          /// ==========================================================================================================
          /// Training Request Response --------------------------------------------------------------------------------
          // BlocProvider(
          //     create: (context) =>
          //         TrainingRequestResponseDynamicForRequestOfUserBloc()),

          BlocProvider(
              create: (context) =>
                  TrainingRequestResponseDynamicWithDistanceByTrainingRequestBloc()),

          BlocProvider(
              create: (context) =>
                  ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit()),

          BlocProvider(
              create: (context) =>
                  TrainingRequestResponseDynamicWithDistanceByChosenAttributesBloc()),

          /// TRAINING OFFER AREA ======================================================================================
          /// ==========================================================================================================
          /// Training Offer -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => TrainingOfferDynamicOfferedByCoachBloc()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingOfferAmongTrainingOfferDynamicOfCoachCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit()),

          /// TRAINING OFFER RESPONSE AREA =============================================================================
          /// ==========================================================================================================
          /// Training Offer Response --------------------------------------------------------------------------------
          // BlocProvider(
          //     create: (context) =>
          //         TrainingOfferResponseDynamicForOfferOfCoachBloc()),

          BlocProvider(
              create: (context) =>
                  TrainingOfferResponseDynamicWithDistanceByTrainingOfferBloc()),

          BlocProvider(
              create: (context) =>
                  ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit()),

          BlocProvider(
              create: (context) =>
                  TrainingOfferResponseDynamicWithDistanceByChosenAttributesBloc()),

          BlocProvider(
              create: (context) =>
                  TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc()),

          BlocProvider(
              create: (context) =>
                  TrainingOfferResponseDynamicRespondedByTraineeBloc()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit()),

          /// TRAINING OFFER ADDING POP UP =============================================================================
          /// ==========================================================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnTrainingOfferAddingPopUpBloc(
                      activityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingOfferAddingPopUpCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  CleanAllButtonOnTrainingOfferAddingPopUpCubit()),

          /// FIND A COACH TRAINING OFFER ==============================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnFindACoachScreenBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc(
                      activityTypeDynamicButtonOnFindACoachScreenBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnFindACoachScreenBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => CleanAllButtonOnFindACoachScreenCubit()),

          /// Training Offer -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  TrainingOfferDynamicWithDistanceByUserBloc()),

          /// Chosen Coach -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => ChosenCoachAmongThoseWhoFoundCubit()),

          /// FIND A TRAINEE TRAINING REQUEST ==========================================================================
          /// Activity Types -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityTypeDynamicButtonOnFindATraineeScreenBloc()),

          /// Activity Names -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc(
                      activityTypeDynamicButtonOnFindATraineeScreenBloc:
                          context.read<
                              ActivityTypeDynamicButtonOnFindATraineeScreenBloc>())),

          BlocProvider(
              create: (context) =>
                  ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit()),

          /// Clean All ------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => CleanAllButtonOnFindATraineeScreenCubit()),

          /// Training Offer -------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) =>
                  TrainingRequestDynamicWithDistanceByUserBloc()),

          /// ACTIVITY CONVERSATIONS ===================================================================================
          BlocProvider(
              create: (context) => ActivityConversationDynamicByUserBloc()),
          // ..add(LoadActivityConversationDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  ChosenActivityConversationDynamicByUserCubit()),

          // /// ACTIVITY MESSAGES ========================================================================================
          // BlocProvider(
          //     create: (context) => ActivityMessageDynamicByUserBloc()
          //       ..add(LoadActivityMessageDynamicByUserEvent(
          //           uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  MessageDynamicByGroupOfActivityConversationBloc()),
          // ..add(LoadMessageDynamicByGroupOfActivityConversationEvent(
          //     uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) => MessageDynamicByActivityConversationBloc()),

          BlocProvider(
              create: (context) => ChosenActivityMessageDynamicByUserCubit()),

          // BlocProvider(
          //     create: (context) =>
          //         ChosenConsistedActivityDynamicWithDistanceByIndividualCreatedActivityCubit()),

          /// TRAINING OFFER CONVERSATIONS =============================================================================
          BlocProvider(
              create: (context) =>
                  TrainingOfferConversationDynamicByUserBloc()),
          // ..add(LoadTrainingOfferConversationDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  GroupedTrainingOfferConversationDynamicByUserCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingOfferConversationDynamicByUserCubit()),

          /// TRAINING OFFER MESSAGES ==================================================================================
          // BlocProvider(
          //     create: (context) => TrainingOfferMessageDynamicByUserBloc()
          //       ..add(LoadTrainingOfferMessageDynamicByUserEvent(
          //           uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  TrainingOfferMessageDynamicByGroupOfTrainingOfferConversationBloc()),
          // ..add(LoadTrainingOfferMessageDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId, trainingOfferConversationList: ))),

          BlocProvider(
              create: (context) =>
                  TrainingOfferMessageDynamicByTrainingOfferConversationBloc()),

          // BlocProvider(
          //     create: (context) =>
          //         GroupedTrainingOfferMessageDynamicByIndividualUserCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingOfferMessageDynamicByUserCubit()),

          /// FIND A COACH CONVERSATIONS ===============================================================================
          BlocProvider(
              create: (context) =>
                  FindACoachConversationDynamicByTraineeBloc()),
          // ..add(LoadFindACoachConversationDynamicByTraineeEvent(
          //     traineeId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  GroupedFindACoachConversationDynamicByTraineeCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenFindACoachConversationDynamicByTraineeCubit()),

          /// FIND A COACH MESSAGES ====================================================================================
          // BlocProvider(
          //     create: (context) => TrainingOfferMessageDynamicByUserBloc()
          //       ..add(LoadTrainingOfferMessageDynamicByUserEvent(
          //           uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  FindACoachMessageDynamicByGroupOfFindACoachConversationBloc()),
          // ..add(LoadFindACoachMessageDynamicByUserEvent(
          //     traineeId: _appNumberConstants.appUserId, findACoachConversationList: ))),

          BlocProvider(
              create: (context) =>
                  FindACoachMessageDynamicByFindACoachConversationBloc()),

          // BlocProvider(
          //     create: (context) =>
          //         GroupedTrainingOfferMessageDynamicByIndividualUserCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenFindACoachMessageDynamicByTraineeCubit()),

          /// TRAINING REQUEST CONVERSATIONS ===========================================================================
          BlocProvider(
              create: (context) =>
                  TrainingRequestConversationDynamicByUserBloc()),
          // ..add(LoadTrainingRequestConversationDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId))),

          BlocProvider(
              create: (context) =>
                  GroupedTrainingRequestConversationDynamicByUserCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingRequestConversationDynamicByUserCubit()),

          /// TRAINING REQUEST MESSAGES ================================================================================
          BlocProvider(
              create: (context) =>
                  TrainingRequestMessageDynamicByGroupOfTrainingRequestConversationBloc()),
          // ..add(LoadTrainingRequestMessageDynamicByUserEvent(
          //     uId: _appNumberConstants.appUserId, trainingRequestConversationList: ))),

          BlocProvider(
              create: (context) =>
                  TrainingRequestMessageDynamicByTrainingRequestConversationBloc()),

          // BlocProvider(
          //     create: (context) =>
          //         GroupedTrainingRequestMessageDynamicByIndividualUserCubit()),

          BlocProvider(
              create: (context) =>
                  ChosenTrainingRequestMessageDynamicByUserCubit()),

          /// PROFILE PAGE =============================================================================================
          /// User Dynamic Bloc ----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => UserDynamicBloc()),
          // ..add(
          //     LoadUserDynamicEvent(uId: _appNumberConstants.appUserId))),

          BlocProvider(create: (context) => CoachBloc()),

          BlocProvider(create: (context) => CoachDynamicBloc()),
          // ..add(LoadCoachDynamicEvent(
          //     coachId: _appNumberConstants.appCoachId))),

          /// Personal Details -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => UserBloc()),

          BlocProvider(create: (_) => GenderDynamicBloc()),

          BlocProvider(create: (_) => CountryCityDynamicByIdBloc()),

          BlocProvider(create: (_) => CountryDynamicBloc()),

          BlocProvider(create: (_) => CityDynamicByCountryBloc()),

          BlocProvider(create: (_) => MembershipTypeBloc()),

          BlocProvider(create: (_) => ChosenMembershipTypeCubit()),

          BlocProvider(create: (_) => CoachingTypeBloc()),

          BlocProvider(create: (_) => ChosenCoachingTypeCubit()),

          BlocProvider(create: (_) => DropdownButtonCubit()),

          BlocProvider(create: (_) => CoachingExperienceDynamicBloc()),

          // BlocProvider(create: (_) => CreationChosenIndexCubit()),

          BlocProvider(create: (_) => ProcessDetailDynamicBloc()),

          BlocProvider(
              create: (_) =>
                  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc()),

          BlocProvider(
              create: (_) =>
                  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc()),

          BlocProvider(
              create: (_) =>
                  ConsistedActivityDynamicByCreatedActivityAttendeeBloc(),
              lazy: false),

          BlocProvider(
              create: (_) => CreatedActivityDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) => TrainingOfferDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) => TrainingDetailDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) => TrainingRequestDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) =>
                  TrainingOfferResponseDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) =>
                  TrainingRequestResponseDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) =>
                  ActivityConversationDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) =>
                  TrainingRequestConversationDynamicByChosenAttributesBloc(),
              lazy: false),

          BlocProvider(
              create: (_) =>
                  TrainingOfferConversationDynamicByChosenAttributesBloc(),
              lazy: false),

          /// FOR POST & PUT & DELETE
          /// ==========================================================================================================
          /// ==========================================================================================================
          /// ==========================================================================================================
          /// ==========================================================================================================
          /// ACTIVITY TEMPLATE
          /// Activity Name Dynamic ----------------------------------------------------------------------------------
          BlocProvider(
            create: (_) => ActivityNameDynamicByChosenAttributesBloc(),
            lazy: false,
          ),

          /// Activity Template ----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => ActivityTemplateBloc()),

          /// USER
          /// Country City Dynamic -------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => CountryCityDynamicByChosenAttributesBloc()),

          /// UserDB ---------------------------------------------------------------------------------------------------
          BlocProvider(create: (_) => UserDBBloc()),

          /// COACH
          /// Coaching Experience Dynamic ------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => CoachingExperienceDynamicByChosenAttributesBloc()),

          /// CoachDB --------------------------------------------------------------------------------------------------
          BlocProvider(create: (_) => CoachDBBloc()),

          /// UserControl ----------------------------------------------------------------------------------------------
          BlocProvider(create: (_) => UserControlCubit()),

          BlocProvider(create: (_) => AttendedActivityByAttendeeBloc()),

          BlocProvider(create: (_) => CreatedActivityDynamicByHostBloc()),

          BlocProvider(create: (_) => ResultOfPreferredActivityDynamicBloc()),

          BlocProvider(
              create: (_) => ChosenResultOfPreferredActivityDynamicCubit()),

          /// FOR VALIDATION
          /// ==========================================================================================================
          /// ==========================================================================================================
          /// ==========================================================================================================
          /// ==========================================================================================================
          /// CREATE ACTIVITY ==========================================================================================
          /// LOCATION TEMPLATE NAME  ==================================================================================
          /// Adding ---------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc()),

          /// LATITUDE LONGITUDE  ======================================================================================
          /// Adding ---------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc()),

          /// ACTIVITY TEMPLATE ========================================================================================
          /// ACTIVITY TEMPLATE NAME ===================================================================================
          /// Adding ---------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfActivityTemplateNameOnActivityTemplateAddingPopUpBloc()),

          /// Updating -------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfActivityTemplateNameOnActivityTemplateUpdatingPopUpBloc()),

          /// LOCATION TEMPLATE ========================================================================================
          /// Location Detail Dynamic ----------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => LocationDetailDynamicByChosenAttributesBloc(),
              lazy: false),

          /// Location Template ----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => LocationTemplateBloc()),

          /// Location Detail ------------------------------------------------------------------------------------------
          BlocProvider(create: (_) => LocationDetailBloc()),

          BlocProvider(
              create: (_) =>
                  ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit()),

          /// LOCATION TEMPLATE NAME ===================================================================================
          /// Adding ---------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfLocationTemplateNameOnLocationTemplateAddingPopUpBloc()),

          /// Updating -------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfLocationTemplateNameOnLocationTemplateUpdatingPopUpBloc()),

          /// LATITUDE LONGITUDE  ======================================================================================
          /// Adding ---------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextfieldOfLatitudeLongitudeOnLocationTemplateAddingPopUpBloc()),

          /// Updating -------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextfieldOfLatitudeLongitudeOnLocationTemplateUpdatingPopUpBloc()),

          /// NAME SURNAME =============================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfNameSurnameOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc()),

          /// USERNAME =================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfUsernameOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc()),

          /// BIRTHYEAR ================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfBirthyearOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc()),

          /// GENDER ===================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfGenderOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  DropdownOfGenderOnPersonalDetailEditingPopUpBloc()),

          /// EMAIL ====================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfEmailOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfEmailOnPersonalDetailEditingPopUpBloc()),

          /// ADDRESS ==================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfAddressOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfAddressOnPersonalDetailEditingPopUpBloc()),

          /// COUNTRY ==================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfCountryOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  DropdownOfCountryOnPersonalDetailEditingPopUpBloc()),

          /// COUNTRY ==================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfCityOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) => DropdownOfCityOnPersonalDetailEditingPopUpBloc()),

          /// ABOUT YOURSELF ===========================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc()),

          /// EXPERINCE ================================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfExperienceYearOnCoachingDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  DropdownOfExperienceYearOnCoachingDetailEditingPopUpBloc()),

          /// MINIMUM LESSON ===========================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) => TextOfMinLessonOnCoachingDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfMinLessonOnCoachingDetailEditingPopUpBloc()),

          /// PRICE (PER LESSON) =======================================================================================
          /// Editing --------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (_) =>
                  TextOfPerLessonPriceOnCoachingDetailEditingPopUpBloc()),

          BlocProvider(
              create: (_) =>
                  TextFieldOfPerLessonPriceOnCoachingDetailEditingPopUpBloc()),

          /// CREATED ACTIVITY =========================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => CreatedActivityBloc()),

          /// CONSISTED ACTIVITY =======================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => ConsistedActivityBloc()),

          /// TRAINING OFFER ===========================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => TrainingOfferBloc()),

          /// TRAINING OFFER RESPONSE ==================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => TrainingOfferResponseBloc()),

          /// TRAINING REQUEST =========================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => TrainingRequestBloc()),

          /// TRAINING REQUEST RESPONSE ================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => TrainingRequestResponseBloc()),

          /// ACTIVITY CONVERSATION ====================================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => ActivityConversationBloc()),

          /// TRAINING REQUEST CONVERSATION ============================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => TrainingRequestConversationBloc()),

          /// TRAINING REQUEST CONVERSATION ============================================================================
          /// Adding, Updating -----------------------------------------------------------------------------------------
          BlocProvider(create: (_) => TrainingOfferConversationBloc()),
        ],

        /// ?This code added later(IF SOMETHING DOESN'T WORK DELETE THIS GESTURE DETECTOR AND MAKE MATERIAL APP CHILD OF MULTIBLOCPROVIDER)
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
            title: 'ActivityApp',
            theme: theme(),
            onGenerateRoute: _appRouter.onGenerateRoute,
            initialRoute: ScreenOfOpening.routeName,
            // initialRoute: ScreenOfHome.routeName,
          ),
        ),
      ),
    );
  }

  // This function is working only when the class changes Stateful Widget. On bloc library explanation about Generate Route Access, it was mentioned that the dispose method closes the _appRouter. When everything completes check below pages  (on Generated Route Access) Explanation is this :
  //?"We need to dispose the _router when the App widget is disposed in order to close all blocs in the AppRouter.""
  // ?https://bloclibrary.dev/#/recipesflutterblocaccess?id=named-route-access
  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
