import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:io';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: CupertinoButton(
          child: Text(label),
          onPressed: () => onPressed,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        // color: Theme.of(context).primaryColor,
        // textColor: Theme.of(context).textTheme.button?.color,
        child: Text(label),
        onPressed: () => onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          textStyle: TextStyle(
            color: Theme.of(context).textTheme.button?.color,
          ),
        ),
      );
    }
  }
}
