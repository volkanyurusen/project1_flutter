import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class TemplatesBody extends StatelessWidget {
  const TemplatesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        TemplateBodyActivityTemplateTitleArea(),
        const TemplateBodyActivityTemplateArea(),
        TemplateBodyLocationTemplateTitleArea(),
        const TemplateBodyLocationTemplateArea(),
      ],
    );
  }
}
