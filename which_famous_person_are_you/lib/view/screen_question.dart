import 'package:flutter/material.dart';
import 'package:which_famous_person_are_you/models/model_quizBrain.dart';
import 'package:which_famous_person_are_you/widgets/widget_custom_selection_button.dart';
import 'package:which_famous_person_are_you/view/screen_result.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // Initializing an Instance of QuizBrain()
  QuizBrain quizBrain = QuizBrain();

  // May be will be used to implement a Progressbar
  List<Icon> scoreKeeper = [];

  // Answer Tracker Method
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(),
            ),
          );

          quizBrain.reset();
          scoreKeeper.clear();
        } else {
          if (userPickedAnswer == correctAnswer) {
            scoreKeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
            quizBrain.checkFinished();
          } else {
            scoreKeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
            quizBrain.checkFinished();
          }
          quizBrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //SizedBox(height: 20),

          /// Question Here
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 40),
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Pangolin',
                  color: Color(0xFF5880EA),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ///Image Here
          Flexible(
            flex: 3,
            child: FractionallySizedBox(
              heightFactor: 0.5,
              widthFactor: 0.8,
              child: Container(
                color: Colors.white,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'images/img1.PNG',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          //SizedBox(height: 25),

          // TRUE / FALSE Buttons are below
          SelectionButton(
            answerOption: 'True',
            userAnswer: () {
              checkAnswer(true);
            },
          ),

          SelectionButton(
            answerOption: 'False',
            userAnswer: () {
              checkAnswer(false);
            },
          ),

          // Progress Indicator Here
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: 0.9,

              //TODO 2: Make This Percentage Dynamic
              center: Text("90.0%"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
