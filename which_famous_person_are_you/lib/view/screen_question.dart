import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:which_famous_person_are_you/models/model_quizBrain.dart';
import 'package:which_famous_person_are_you/widgets/widget_custom_button.dart';

//TODO 1 DONE: Implement The Questions at the top
//TODO 2 DONE: Implement an image in the middle
//TODO 3 DONE: Implement TRUE / FALSE Buttons vertically after the Image
//TODO 4 DONE: Implement a Progress Bar At The Bottom
//TODO 5 DONE: Implement The Brain Logics
//TODO 6 DONE: Implement End Of Quiz Checking
//TODO 7: Re-route to Result Page upon quiz finishing

//TODO 8: Plan again about result page UI

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
          Alert(
            context: context,
            title: "Finished!",
            desc: "You've reached the end of the quiz",
            buttons: [
              DialogButton(
                child: Text(
                  "CANCEL",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();

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
              padding: EdgeInsets.fromLTRB(15, 50, 15, 40),
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
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
        ],
      ),
    );
  }
}
