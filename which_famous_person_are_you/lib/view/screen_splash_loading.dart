import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:which_famous_person_are_you/view/screen_question.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      curve: Curves.easeInOut,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      duration: 4000,
      splashIconSize: MediaQuery.of(context).size.height,
      backgroundColor: Colors.white,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Studio 86",
              style: TextStyle(
                fontSize: 60,
                color: Color(0xFF5880EA),
                fontWeight: FontWeight.w900,
                fontFamily: 'Dancing',
                //letterSpacing: 5.5,
              ),
            ),
          ),
        ],
      ),
      nextScreen: QuestionScreen(),
    );
  }
}
