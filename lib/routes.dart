import 'package:flutter/cupertino.dart';

import 'screens/homeScrn.dart';
import 'screens/loginScrn.dart';
import 'screens/splashScrn.dart';

var routes = <String, WidgetBuilder>{
  "/": (context) => SplashScreen(),
  "/Login": (context) => LoginScreen(),
  "/Home": (context) => HomeScreen(),
};
