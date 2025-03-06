import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/signin_view.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/main_view.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_e_commerce/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case CheckoutView.routeName:
      return MaterialPageRoute(
          builder: (context) => CheckoutView(
                cartEntity: settings.arguments as CartEntity,
              ));
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
