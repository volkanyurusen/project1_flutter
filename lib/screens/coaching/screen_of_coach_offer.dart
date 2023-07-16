// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfCoachOffer extends StatelessWidget {
  static const String routeName = 'screen_of_coach_offer';

  const ScreenOfCoachOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          _unchooseChosenTrainingOfferResponse(context);
          return Future(() => true);
        },
        child: Scaffold(
          appBar: _createTrainingPictureOnTop(context),
          body: const CoachOfferBody(),
          bottomNavigationBar: const CustomBottomNavigationBar(),
        ));
  }

  // CREATE ============================================================================================================
  _createTrainingPictureOnTop(BuildContext context) => PreferredSizeForPicture(
      context: context,
      child: AppBar(
        flexibleSpace: _buildChosenTrainingImage(),
        // actions: [_buildCancelIcon()],
      ));

  // TRAINING IMAGE ====================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<
          ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
          ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState>
      _buildChosenTrainingImage() => BlocBuilder<
              ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
              ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState>(
          builder: (context, chosenState) => AppBarHero(
              tag: _chosenTrainingHeroTag(chosenState),
              image: _displayChosenTrainingImage(chosenState)));

  // DISPLAY ===========================================================================================================
  AssetImage _displayChosenTrainingImage(
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
        chosenState,
  ) =>
      AssetImage(
          'assets/images/activities/${chosenState.chosenTrainingOfferResponseDynamicList.last.trainingOfferDynamic.trainingDetailDynamic.activityNameDynamic.activityTitle.toLowerCase()}.jpg');

  // METHODS ===========================================================================================================
  // Hero Methods ------------------------------------------------------------------------------------------------------
  String _chosenTrainingHeroTag(
    ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
        chosenState,
  ) =>
      chosenState.chosenTrainingOfferResponseDynamicList.last
          .trainingOfferDynamic.trainingOfferId
          .toString();

  // CANCEL ICON =======================================================================================================
  // BUILD =============================================================================================================
  // BlocBuilder<
  //         ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
  //         ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState>
  //     _buildCancelIcon() => BlocBuilder<
  //             ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeCubit,
  //             ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState>(
  //         builder: (context, state) => IconButton(
  //               splashRadius: 18,
  //               icon: _displayIcon(),
  //               onPressed: () {
  //                 _openCancelTheActivityPopUp(context, state);
  //               },
  //             ));

  // DISPLAY ===========================================================================================================
  // Icon _displayIcon() => const Icon(Icons.clear_outlined);

  // // METHODS ===========================================================================================================
  // void _openCancelTheActivityPopUp(
  //   BuildContext context,
  //   ChosenTrainingOfferResponseAmongTrainingOfferResponseDynamicOfTraineeState
  //       chosenState,
  // ) =>
  //     showDialog(
  //         barrierDismissible: false,
  //         context: context,
  //         builder: (context) {
  //           return TrainingDeletingPopUp();
  //         });

  // Unchoose Methods --------------------------------------------------------------------------------------------------
  void _unchooseChosenTrainingOfferResponse(BuildContext context) {
    context
        .read<
            TrainingOfferResponseDynamicWithDistanceOfChosenActivityByTraineeBloc>()
        .add(
            CleanTrainingOfferResponseDynamicWithDistanceOfChosenActivityByTrainee());
  }
}
