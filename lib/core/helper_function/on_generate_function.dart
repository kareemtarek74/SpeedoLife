import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Auth/presentation/view/widgets/sign_in_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());

    default:
      return MaterialPageRoute(builder: (context) => const SignInView());
  }
}
