import 'package:flutter/material.dart';
import 'package:which_famous_person_are_you/widgets/widget_custom_share_button.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ///Congrats Text
          Center(
            child: Text(
              "Congratulations!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),

          /// Result Image
          Container(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'images/img1.PNG',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Description Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "You are ananta Jalil becuzuasdau ausnd asudn auw aksjdnak uakwdasjn dkasud asudakw dkjasnd kasud aksudwj asnd jaksd uasdh kwank ajskdu hkaushduawdw",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Pangolin',
                color: Colors.black,
              ),
            ),
          ),

          // Share this Text
          //Share Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Share this:",
                  style: TextStyle(fontSize: 18, fontFamily: 'Pangolin'),
                ),
              ),

              //TODO 1: Implement Sharing Functionality

              /// Share FACEBOOK
              GestureDetector(
                onTap: () {},
                child: ShareButton(
                  imageUrl: 'images/fb.png',
                ),
              ),

              SizedBox(width: 30),

              /// Share TWITTER
              GestureDetector(
                onTap: () {},
                child: ShareButton(
                  imageUrl: 'images/twtr.png',
                ),
              ),
              SizedBox(width: 100),
            ],
          )
        ],
      ),
    );
  }
}
