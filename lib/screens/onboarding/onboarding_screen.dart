import 'package:flutter/material.dart';
import './onboarding_screens/onboarding_screens.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'onboarding_screen';

  //
  //static Route route() {
  //   return MaterialPageRoute(
  //       builder: (_) => OnboardingScreen(),
  //       settings: const RouteSettings(name: routeName));
  // }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'UserInfoScreen'),
  ];

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
            body: TabBarView(
              children: [
                UserInfoScreen(tabController: tabController),
              ],
            ),
          );
        },
      ),
    );
  }
}
