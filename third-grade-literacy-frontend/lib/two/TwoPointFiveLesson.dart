import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/two/quiz/QuizTwoPointFive.dart';
import 'package:hearatale_literacy_app/two/ScoreMenuTwo.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';
import '../helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TwoPointFiveLesson()
  ));
}
class TwoPointFiveLesson extends StatefulWidget {
  @override
  TwoPointFive createState() => TwoPointFive();
}
class TwoPointFive extends State<TwoPointFiveLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionTwo/TwoPointFive/crash.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointFive/fish.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointFive/push.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointFive/vanish.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointFive/wash.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointFive/wish.png')];
  var words = [['crash', 'crashes'], ['fish', 'fishes'],
    ['push', 'pushes'], ['vanish', 'vanishes'], ['wash', 'washes'],
    ['wish', 'wishes']];
  var music = ["crash_crashes.mp3",
    "fish_fishes.mp3",
    "push_pushes.mp3",
    "vanish_vanishes.mp3",
    "wash_washes.mp3",
    "wish_wishes.mp3"];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#2.5_wordsthatendSHaddES.mp3';
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
                                pageBuilder: (context, _, __) => QuizTwoPointFive(),
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
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => PiggyBank(),
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
                      stopAudio();
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
                  Text('For third person singular action words,',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('to say someone or something does something,',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('base words that end with sh add ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('.',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.5,
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
                      height: screenHeight * 0.5,
                      child: pictures[tracker],
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.5,
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
