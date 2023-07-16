import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class CoachesBody extends StatelessWidget {
  final TabController tabController;
  final double screenHeight;
  const CoachesBody({
    required this.tabController,
    required this.screenHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: CustomColumn(children: [
        CustomAppSizedBox(height: screenHeight / 10),
        TabBar(
          onTap: (tabIndex) =>
              context.read<IndexOfCoachingCoachTabCubit>().tabChanged(tabIndex),
          controller: tabController,
          tabs: const [
            Tab(text: 'Training offer'),
            Tab(text: 'Find a trainee'),
          ],
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            child: TabBarView(
              controller: tabController,
              children: const [
                TabOfTrainingOffer(),
                TabOfFindATrainee(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
