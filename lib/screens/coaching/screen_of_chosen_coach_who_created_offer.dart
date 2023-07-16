import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';




class ScreenOfChosenCoachWhoCreatedOffer extends StatelessWidget {
  static const String routeName = 'screen_of_chosen_coach_who_created_offer';

  const ScreenOfChosenCoachWhoCreatedOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
      appBar: _createCoachPhotoOnTop(context),
      body: const ChosenCoachWhoCreatedOfferBody(),
    );
  }

  /// CREATE ===========================================================================================================
  _createCoachPhotoOnTop(BuildContext context) => PreferredSizeForPicture(
      context: context, child: AppBar(flexibleSpace: _buildChosenCoachPhoto()));

  /// BUILD ============================================================================================================
  BlocBuilder<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
          ChosenOfferAmongThoseWhoCreatedTrainingOfferState>
      _buildChosenCoachPhoto() => BlocBuilder<
              ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
              ChosenOfferAmongThoseWhoCreatedTrainingOfferState>(
          builder: (context, chosenState) => AppBarHero(
                tag: _choiceTrainingHeroTag(chosenState),
                image: _displayChoiceTrainingImage(chosenState),
              ));

  /// DISPLAY ==========================================================================================================
  NetworkImage _displayChoiceTrainingImage(
    ChosenOfferAmongThoseWhoCreatedTrainingOfferState chosenState,
  ) =>
      NetworkImage(chosenState.chosenTrainingOfferDynamicWithDistanceList.last
          .coachDynamic.userDynamic.picUrl);

  /// METHODS ==========================================================================================================
  /// Hero Methods -----------------------------------------------------------------------------------------------------
  String _choiceTrainingHeroTag(
    ChosenOfferAmongThoseWhoCreatedTrainingOfferState chosenState,
  ) =>
      chosenState
          .chosenTrainingOfferDynamicWithDistanceList.last.trainingOfferId
          .toString() +
      chosenState.chosenTrainingOfferDynamicWithDistanceList.last.coachDynamic
          .userDynamic.username;
}
