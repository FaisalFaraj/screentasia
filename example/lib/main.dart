import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreentasiaInit(
      adaptiveFrom: AdaptiveFrom.mobile,
      adaptivePercentage:
          const AdaptivePercentage(mobile: 100, desktop: 100, tablet: 100),
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter screentasia',
            home: Scaffold(
                appBar: AppBar(
                  title: const Text('Flutter screentasia Demo  Page'),
                ),
                body: Container(
                    color: Colors.blue,
                    width: 100.wp.ap(
                        adaptivePercentage: const AdaptivePercentage(
                            desktop: 100, tablet: 50, mobile: 25)))));
      },
    );
  }
}
