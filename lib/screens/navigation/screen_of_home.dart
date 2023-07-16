import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfHome extends StatefulWidget {
  static const String routeName = '/';

  const ScreenOfHome({super.key});

  @override
  State<ScreenOfHome> createState() => _ScreenOfHomeState();
}

class _ScreenOfHomeState extends State<ScreenOfHome> {
  final List<Widget> screens = [
    const PageOfDiscover(),
    const PageOfExistence(),
    PageOfCoaching(),
    const PageOfMessage(),
    const PageOfProfile(),
  ];
  late CustomBottomNavigationBar _customBottomNavigationBar;

  @override
  void initState() {
    super.initState();
    _customBottomNavigationBar = _createCustomBottomNavigationBar();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexOfPageCubit, IndexOfPageState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: _customBottomNavigationBar,
          body: screens.elementAt(state.currentIndex),
        );
      },
    );
  }

  CustomBottomNavigationBar _createCustomBottomNavigationBar() =>
      const CustomBottomNavigationBar();
}
