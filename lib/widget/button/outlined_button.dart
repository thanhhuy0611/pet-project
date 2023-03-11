

import 'package:flutter/material.dart';
import 'package:jaho_challenge/widget/button/button_decoration.dart';

class CustomOutlinedButton extends StatelessWidget with ElevatedButtonDecoration {
  final String label;
  final void Function() onTap;
  const CustomOutlinedButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle(context,
        color: Theme.of(context).backgroundColor,
        borderColor: Theme.of(context).primaryColor,
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: Theme.of(context).textTheme.button!,
      ),
    );
  }
}
