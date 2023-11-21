import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({
    required this.deviceSize,
    required this.child,
  });

  final Size deviceSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: deviceSize.width, height: deviceSize.height, child: child);
  }
}
