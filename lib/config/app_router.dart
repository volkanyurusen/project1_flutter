// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/screens/zscreens.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScreenOfOpening.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfOpening());

      case '/':
        //
        // case LaunchingScreen.routeName:
        //   return MaterialPageRoute(builder: (_) => LaunchingScreen());
        // case LoginScreen.routeName:
        //   return MaterialPageRoute(builder: (_) => LoginScreen());
        return MaterialPageRoute(builder: (_) => const ScreenOfHome());

      /// PAGE OF DISCOVER =============================================================================================
      case ScreenOfUserCardDetail.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfUserCardDetail());



      /// PAGE OF EXISTENCE ============================================================================================
      /// Creation Tab -------------------------------------------------------------------------------------------------
      case ScreenOfChosenCreatedActivity.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfChosenCreatedActivity());
      case ScreenOfChosenAttendeeOnCreation.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenAttendeeOnCreation());

      /// Attendance Tab -----------------------------------------------------------------------------------------------
      case ScreenOfChosenConsistedActivity.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenConsistedActivity());
      case ScreenOfHost.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfHost());
      case ScreenOfChosenAttendeeOnAttendance.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenAttendeeOnAttendance());

      /// Template Tab -------------------------------------------------------------------------------------------------

      /// PAGE OF COACHING =============================================================================================
      /// For Users ----------------------------------------------------------------------------------------------------
      case ScreenOfUsers.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfUsers());
      case ScreenOfTrainingRequestResponse.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfTrainingRequestResponse());
      case ScreenOfChosenCoach.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfChosenCoach());
      case ScreenOfResultFindACoach.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfResultFindACoach());
      case ScreenOfChosenCoachWhoCreatedOffer.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenCoachWhoCreatedOffer());

      /// For Found Coaches --------------------------------------------------------------------------------------------
      case ScreenOfFoundCoaches.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfFoundCoaches());
      case ScreenOfCoachOffer.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfCoachOffer());
      case ScreenOfChosenCoachWhoFound.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenCoachWhoFound());

      /// For Coaches --------------------------------------------------------------------------------------------------
      case ScreenOfCoaches.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfCoaches());
      case ScreenOfTrainingOfferResponse.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfTrainingOfferResponse());
      case ScreenOfChosenTrainee.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfChosenTrainee());
      case ScreenOfResultFindATrainee.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfResultFindATrainee());
      case ScreenOfChosenTraineeWhoCreatedRequest.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenTraineeWhoCreatedRequest());

      /// PAGE OF MESSAGE ==============================================================================================
      /// For Activity -------------------------------------------------------------------------------------------------
      case ScreenOfChosenActivityDetail.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenActivityDetail());
      case ScreenOfChosenActivityMessage.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfChosenActivityMessage());

      /// For Training Offer -----------------------------------------------------------------------------------------
      case ScreenOfConversationOfTrainingOffer.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfConversationOfTrainingOffer());
      case ScreenOfChosenTrainingOfferDetail.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenTrainingOfferDetail());
      case ScreenOfChosenTrainingOfferMessage.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfChosenTrainingOfferMessage());
      case ScreenOfChosenResponseWhoRespondedTrainingOffer.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                const ScreenOfChosenResponseWhoRespondedTrainingOffer());

      /// For Training Request -----------------------------------------------------------------------------------------
      case ScreenOfConversationOfTrainingRequest.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfConversationOfTrainingRequest());
      case ScreenOfChosenTrainingRequestDetail.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenTrainingRequestDetail());
      case ScreenOfChosenTrainingRequestMessage.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfChosenTrainingRequestMessage());
      case ScreenOfChosenResponseWhoRespondedTrainingRequest.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                const ScreenOfChosenResponseWhoRespondedTrainingRequest());

      /// For Find A Coach -----------------------------------------------------------------------------------------
      case ScreenOfConversationOfFindACoach.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfConversationOfFindACoach());
      case ScreenOfChosenFindACoachDetail.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfChosenFindACoachDetail());
      case ScreenOfChosenFindACoachMessage.routeName:
        return MaterialPageRoute(
            builder: (_) => ScreenOfChosenFindACoachMessage());

      // case ScreenOfChosenResponseWhoRespondedTrainingOffer.routeName:
      //   return MaterialPageRoute(
      //       builder: (_) =>
      //           const ScreenOfChosenResponseWhoRespondedTrainingOffer());

      /// PAGE OF PROFILE ==============================================================================================
      /// For Account Details ------------------------------------------------------------------------------------------
      case ScreenOfPersonalDetails.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfPersonalDetails());
      case ScreenOfActivityPreferences.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfActivityPreferences());
      case ScreenOfUserTypeDetails.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfUserTypeDetails());
      case ScreenOfPaymentDetails.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfPaymentDetails());
      case ScreenOfSecurityDetails.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfSecurityDetails());

      /// For Type Details ---------------------------------------------------------------------------------------------
      case ScreenOfLocationDetails.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfLocationDetails());

      /// For Type Details ---------------------------------------------------------------------------------------------
      case ScreenOfUserTypes.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfUserTypes());
      case ScreenOfChosenUserType.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfChosenUserType());
      case ScreenOfCoachingTypeDetails.routeName:
        return MaterialPageRoute(
            builder: (_) => const ScreenOfCoachingTypeDetails());
      case ScreenOfCoachingTypes.routeName:
        return MaterialPageRoute(builder: (_) => const ScreenOfCoachingTypes());
      case ScreenOfChosenCoachingType.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfChosenCoachingType());

      /// For Coaching Details -----------------------------------------------------------------------------------------
      case ScreenOfCoachingDetails.routeName:
        return MaterialPageRoute(builder: (_) => ScreenOfCoachingDetails());

        // ignore: dead_code
        break;
      default:
        return _errorRoute();
    }
  }

  static Route? _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error Page'),
              ),
            ),
        settings: const RouteSettings(name: '/error'));
  }

  // This fucntion only works if the BlocProvider.value is created in this AppRouter Class. If the value doesn't created there is no reason to use it.
  // void dispose() {}
}
