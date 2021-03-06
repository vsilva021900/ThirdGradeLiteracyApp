import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/three/quiz/QuizThreePointOne.dart';
import 'package:hearatale_literacy_app/three/ScoreMenuThree.dart';
import '../helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: ThreePointOneLesson()
  ));
}
class ThreePointOneLesson extends StatefulWidget {
  @override
  ThreePointOne createState() => ThreePointOne();
}
class ThreePointOne extends State<ThreePointOneLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionThree/ThreePointOne/1_4_dark-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/2_4_hard-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/3_4_long-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/4_4_quiet-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/5_4_small-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/6_4_strong-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/7_4_sweet-er-est.jpg'),
    Image.asset('assets/dropbox/sectionThree/ThreePointOne/8_4_young-er-est.png')];
  var words = [['dark', 'darker', 'darkest'], ['hard', 'harder', 'hardest'],
    ['long', 'longer', 'longest'], ['quiet', 'quieter', 'quietest'],
    ['small', 'smaller', 'smallest'], ['strong', 'stronger', 'strongest'],
    ['sweet', 'sweeter', 'sweetest'], ['young', 'younger', 'youngest']];
  var music = ["dark.mp3",
    "hard.mp3",
    "long.mp3",
    "quiet.mp3",
    "small.mp3",
    "strong.mp3",
    "sweet.mp3",
    "young.mp3"];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#3.1_mostcomparewordsjustaddERorEST.mp3';
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    if (marker) {
      playAudio();
    }
    marker = false;
    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                sideBarWithReplay(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }

  Widget sideBarWithReplay(BuildContext context) {
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
                        stopAudio();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => QuizThreePointOne(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playAudio();
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      stopAudio();
                       Navigator.push(
                           context,
                           PageRouteBuilder(
                               pageBuilder: (context, _, __) => ScoreThree(),
                               transitionDuration: Duration(seconds: 0)
                           )
                       );
                    },
                  )
              ),
              pinkPigButton(context)
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // can probably simplify with RichText
                  Text('Most words that compare things add ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('er ',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                  Text('to say more or add ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('est ',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                  Text('to say most.',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.6,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == 0)? pictures.length - 1 : tracker - 1;});
                          playAudio2();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: pictures[tracker],
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.6,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == pictures.length - 1)? 0 : tracker + 1;});
                          playAudio2();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child:
                      Text(words[tracker][0], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][1], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][2], style: textStyle(Colors.black, 30))
                  )
                ],
              )
            ]
        )
    );
  }
  playAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(questionAudio);
  }
  playAudio2() async {
    stopAudio();
    audioPlayer = await audioCache.play(music[tracker]);
  }
}
