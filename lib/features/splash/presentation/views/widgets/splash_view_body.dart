import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/services/firebase_auth_service.dart';
import 'package:fruit_e_commerce/core/services/shared_preferances_singleton.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/signin_view.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/main_view.dart';
import 'package:fruit_e_commerce/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    execureNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment:
              Localizations.localeOf(context).languageCode == 'ar'
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void execureNavigation() {
    bool isOnBoardingView = prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingView) {
        var isUserLoggedIn = FirebaseAuthService().isUserSignedIn();
        if (isUserLoggedIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
