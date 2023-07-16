import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class SectionSkelton extends StatelessWidget {
  final double screenWidth;
  final bool isLastSection;

  const SectionSkelton({
    required this.screenWidth,
    required this.isLastSection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _createTitleSkelton(),
        const CustomAppSizedBox(height: 5),
        _displayActivityTypeDynamicSkelton(screenWidth),
        CustomAppSizedBox(height: isLastSection ? 32 : 0),
      ],
    );
  }

  // TITLE SKELTON =====================================================================================================
  // CREATE ============================================================================================================
  _createTitleSkelton() => Column(
        children: [
          _createActivityTitleArea(),
          CustomAppDivider(),
        ],
      );

  // ACTIVITY TITLE ====================================================================================================
  // CREATE ============================================================================================================
  AppHeader _createActivityTitleArea() => AppHeader(
      spaceFromUpperWidget: 32, firstWidget: _displaySkeltonContainer());

  // DISPLAY ===========================================================================================================
  SkeltonContainer _displaySkeltonContainer() =>
      SkeltonContainer(width: 125, height: 25);

  // ACTIVITY TITLE ====================================================================================================
  // CREATE ============================================================================================================
  SkeltonWrap _displayActivityTypeDynamicSkelton(
    double screenWidth,
  ) =>
      SkeltonWrap(screenWidth: screenWidth, numberOfWidget: 8);
}
