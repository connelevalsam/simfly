import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:rive/rive.dart';

import '../widgets/auth_dialog_widget.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Material materialButton;
  late int index;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AuthScreen()));
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Get started',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: const [
                        Text(
                          "Native Fashion Evolved",
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Poppins",
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Don't speak. Let your dressing address the situation. "
                          ""
                          "Move different, the ancestors are with you!.",
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  GestureDetector(
                    onTap: () {
                      _btnAnimationController.isActive = true;
                      Future.delayed(
                        const Duration(milliseconds: 800),
                        () {
                          AuthDialog()
                              .customSignInDialog(context, onCLosed: (_) {});
                        },
                      );
                    },
                    child: SizedBox(
                      height: 64,
                      width: 260,
                      child: Stack(
                        children: [
                          RiveAnimation.asset(
                            "assets/RiveAssets/button.riv",
                            controllers: [_btnAnimationController],
                          ),
                          Positioned.fill(
                            top: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.arrow_forward_sharp),
                                SizedBox(width: 8),
                                Text(
                                  "Enter the shop!",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Registration includes access to over 200+ designs "
                      "for both Kaftan, Senator, Agbada, hand "
                      "crafted shoes.",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
