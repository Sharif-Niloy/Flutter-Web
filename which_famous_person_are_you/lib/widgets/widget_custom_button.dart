import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  SelectionButton({this.answerOption, this.userAnswer});
  final String answerOption;
  final Function userAnswer;

  @override
  Widget build(BuildContext context) {
    double _scrnWidth = MediaQuery.of(context).size.width;

    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GestureDetector(
          onTap: () {
            userAnswer();
          },
          child: Container(
            width: _scrnWidth * 0.90,
            child: Center(
              child: Text(
                answerOption.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 2,
                  spreadRadius: 3,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5880EA).withOpacity(0.8),
                  Color(0xff4D58DE).withOpacity(0.8),
                  Color(0xFF5880EA).withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
