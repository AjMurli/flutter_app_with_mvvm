import 'package:flutter/material.dart';
import 'package:flutter_app_with_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_app_with_mvvm/view/home_screen.dart';
import 'package:flutter_app_with_mvvm/view/login_view.dart';
import 'package:flutter_app_with_mvvm/view/signup_view.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
            
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text("No Route Defined")),
          );
        });
    }
  }
}
