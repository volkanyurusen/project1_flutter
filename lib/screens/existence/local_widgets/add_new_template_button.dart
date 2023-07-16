import 'package:flutter/material.dart';

class AddNewTemplateIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const AddNewTemplateIconButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.add_circle_outline_outlined, size: 18),
        onPressed: onPressed);
  }
}
