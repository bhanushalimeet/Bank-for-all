import 'package:flutter/material.dart';

import 'splash_screen/splash_screen.dart';
import 'utils/setup_locator.dart';
import 'utils/theme.dart';

void main() {
  // setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: SplashScreen(),
    );
  }
}
