import 'package:flutter/material.dart';
import 'two/TwoPointOneLesson.dart';
import 'two/TwoPointTwoLesson.dart';
import 'two/TwoPointThreeLesson.dart';
import 'two/TwoPointFourLesson.dart';
import 'two/TwoPointFiveLesson.dart';
import 'two/TwoPointSixLesson.dart';
import 'two/quiz/QuizTwo.dart';
import 'two/ScoreMenuTwo.dart';
import 'helper.dart';


class MainTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                sideBar(context),
                Expanded(
                    child: subSections(context)
                )
              ],
            )
        )
    );
  }
}

Widget sideBar(BuildContext context) {
  return Container(
      color: const Color(0xffc4e8e6),
      child: Column(
          children: <Widget>[
            backButton(context),
            homeButton(context),
            Spacer(flex: 5),
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                    icon: Image.asset('assets/placeholder_quiz_button.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => QuizTwo(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    }
                )
            ),
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                  icon: Image.asset('assets/star_button.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => ScoreTwo(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                )
            ),
            pinkPigButton(context),
          ]
      )
  );
}

Widget subSections(BuildContext context) {
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // section title
          Text('Base Words and Endings - s, ies, es',
              style: textStyle(Colors.black, 30)
          ),
          // 2.1 and 2.2
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 2.1
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => TwoPointOneLesson(),
                      transitionDuration: Duration(seconds: 0)
                    )
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: screenHeight / 4, maxWidth: screenWidth * 0.25),
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.1.png',
                    fit: BoxFit.contain,
                  )
                )
              ),
              // 2.2
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => TwoPointTwoLesson(),
                      transitionDuration: Duration(seconds: 0)
                    )
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: screenHeight / 4, maxWidth: screenWidth * 0.5),
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.2.png',
                    fit: BoxFit.contain,
                  )
                )
              )
            ],
          ),
          // 2.3 and 2.4
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 2.3
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => TwoPointThreeLesson(),
                      transitionDuration: Duration(seconds: 0)
                    )
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: screenHeight / 4, maxWidth: screenWidth / 3),
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.3.png',
                    fit: BoxFit.contain,
                  )
                )
              ),
              // 2.4
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => TwoPointFourLesson(),
                      transitionDuration: Duration(seconds: 0)
                    )
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: screenHeight / 4, maxWidth: screenWidth / 3),
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.4.png',
                    fit: BoxFit.contain,
                  )
                )
              )
            ],
          ),
          // 2.5 and 2.6
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 2.5
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => TwoPointFiveLesson(),
                      transitionDuration: Duration(seconds: 0)
                    )
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: screenHeight / 4, maxWidth: screenWidth / 3),
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.5.png',
                    fit: BoxFit.contain,
                  )
                )
              ),
              // 2.6
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => TwoPointSixLesson(),
                      transitionDuration: Duration(seconds: 0)
                    )
                  );
                },
                child: Container(
                  constraints: BoxConstraints(maxHeight: screenHeight / 4, maxWidth: screenWidth / 3),
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.6.png',
                    fit: BoxFit.contain,
                  )
                )
              )
            ],
          )
        ],
      )
  );
}