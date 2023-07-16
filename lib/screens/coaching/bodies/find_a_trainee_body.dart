import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class FindATraineeBody extends StatelessWidget {
  const FindATraineeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnFindATraineeScreenCubit>(context,
            listen: true);
    double screenWidth = MediaQuery.of(context).size.width;

    return BasicScrollView(
      children: [
        FindATraineeBodyActivityTypeArea(
            cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        FindATraineeBodyActivityNameArea(
            cleanActivityButton: cleanActivityButton, screenWidth: screenWidth),
        FindATraineeBodyButtonsArea(screenWidth: screenWidth),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/widgets/widget.dart';

// import 'zbodies.dart';

// class FindATraineeBody extends StatelessWidget {
//   const FindATraineeBody({Key? key}) : super(key: key);

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
//           FindATraineeBodyTrainingOfferNumberArea(
//               state: state, screenWidth: screenWidth),
//           FindATraineeBodyTrainingOfferArea(
//               state: state,
//               screenHeight: screenHeight,
//               screenWidth: screenWidth)
//         ],
//       );
// }
