import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfCoaches extends StatefulWidget {
  static const String routeName = 'screen_of_coaches';

  const ScreenOfCoaches({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenOfCoaches> createState() => ScreenOfCoachesState();
}

class ScreenOfCoachesState extends State<ScreenOfCoaches>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = _createTabControllerInstance();
  }

  // TAB CONTROLLER INSTANCE ===========================================================================================
  // CREATE ============================================================================================================
  TabController _createTabControllerInstance() => TabController(
        length: 2,
        vsync: this,
        initialIndex: context.read<IndexOfCoachingCoachTabCubit>().state.currentIndex,
      );

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 2, vsync: this);
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenHeight = context.height;

    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: CoachesBody(
            tabController: _tabController, screenHeight: screenHeight));
  }
}
