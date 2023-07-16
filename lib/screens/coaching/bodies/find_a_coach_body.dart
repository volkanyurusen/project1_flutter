import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class FindACoachBody extends StatelessWidget {
  const FindACoachBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnFindACoachScreenCubit>(context,
            listen: true);
    double screenWidth = MediaQuery.of(context).size.width;

    return BasicScrollView(
      children: [
        FindACoachBodyFoundButtonArea(),
        FindACoachBodyActivityTypeArea(
            cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        FindACoachBodyActivityNameArea(
            cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        // FindACoachBodyActivityLevelArea(
        //     cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        FindACoachBodyButtonsArea(screenWidth: screenWidth),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/widgets/widget.dart';

// import 'zbodies.dart';

// class FindACoachBody extends StatelessWidget {
//   const FindACoachBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return BlocBuilder<
//         BringAllTrainingOfferDynamicsWithDistanceByIndividualUserBloc,
//         BringAllTrainingOfferDynamicsWithDistanceByIndividualUserState>(
//       builder: (context, state) {
//         switch (state.status) {
//           case Status.initial:
//             return const StateLoading();
//           case Status.loading:
//             return const StateLoading();
//           case Status.success:
//             if (state
//                 .bringAllTrainingOfferDynamicsWithDistanceByIndividualUserList
//                 .isEmpty) {
//               return const InformationAboutExisting(detailLabel: 'coach offer');
//             } else {
//               return _bringAllTrainingOfferFromDBAndDisplayThem(
//                   state, screenHeight, screenWidth);
//             }
//           case Status.failure:
//             return StateError(error: state.error);
//         }
//       },
//     );
//   }

//   CustomColumn _bringAllTrainingOfferFromDBAndDisplayThem(
//     BringAllTrainingOfferDynamicsWithDistanceByIndividualUserState state,
//     double screenHeight,
//     double screenWidth,
//   ) =>
//       CustomColumn(
//         children: [
//           FindACoachBodyTrainingOfferNumberArea(
//               state: state, screenWidth: screenWidth),
//           FindACoachBodyTrainingOfferArea(
//               state: state,
//               screenHeight: screenHeight,
//               screenWidth: screenWidth)
//         ],
//       );
// }
