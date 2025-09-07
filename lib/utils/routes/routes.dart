import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/sign_up_screen.dart';
import 'package:mvvm/view/splash_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings setting) {
   // print("✅ Route call hua: ${setting.name}");
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUpScreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen(),
        );
      default:
       return MaterialPageRoute(
          builder: (context) {
            return Scaffold(body: Center(child: Text('No route defined for ${setting.name}')));
          },
        );
    }
  }
}
