import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointThree.dart';
import 'package:hearatale_literacy_app/helper.dart';


class SixPointThreeLesson extends StatefulWidget {
  @override
  SixPointThree createState() => SixPointThree();
}

class SixPointThree extends State<SixPointThreeLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointThree/he'll.png",
    "assets/dropbox/SectionSix/SixPointThree/I'll.png",
    "assets/dropbox/SectionSix/SixPointThree/she'll.png",
    "assets/dropbox/SectionSix/SixPointThree/they'll.png",
    "assets/dropbox/SectionSix/SixPointThree/we'll.png",
    "assets/dropbox/SectionSix/SixPointThree/you'll.png",
  ];
  var words = [
    ["he will", "he'll", "He'll be better off juggling balls"],
    ["I will", "I'll", "\"Maybe I'll diet tomorrow,\" Elephant thinks"],
    ["she will", "she'll", "She'll blush if you say something nice about her"],
    ["they will", "they'll", "They'll be best friends forever"],
    ["we will", "we'll", "In a minute maybe we'll remember what we forgot"],
    ["you will", "you'll ", "You'll not often seen a busier vet"],
  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointThree/1b_hewill_he'll_He'llbebetteroffifhe.mp3",
    "dropbox/SectionSix/SixPointThree/2b_Iwill_I'll_MaybeI'lldiettomorrow.mp3",
    "dropbox/SectionSix/SixPointThree/3b_shewill_She'll_she'llblushifyousay.mp3",
    "dropbox/SectionSix/SixPointThree/4b_theywill_they'll_They'llbebestfriendsforever.mp3",
    "dropbox/SectionSix/SixPointThree/5b_wewill_we'll_Inaminutemaybewe'll.mp3",
    "dropbox/SectionSix/SixPointThree/6b_youwill_you'll_Uou'llnotoftensee.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionSix/SixPointThree/#6.3_contractionswithWILLadd'll.mp3";

  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    if (marker) {
      marker = false;
      playSentenceAudio();
    }

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                                pageBuilder: (context, _, __) => QuizSixPointThree(),
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
                        playWordsAudio();
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
                              pageBuilder: (context, _, __) => ScoreSix(),
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
    double textFontSize = screenWidth / 26;
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pronoun contractions with ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('will ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('add ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('\'ll',
                      style: textStyle(Colors.red, screenWidth / 24)
                  )
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
                          playWordsAudio();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: Image.asset(pictures[tracker]),
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
                          playWordsAudio();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(words[tracker][0],
                      style: textStyle(Colors.black, textFontSize)
                  ),
                  Text(words[tracker][1],
                      style: textStyle(Colors.black, textFontSize)
                  ),
                ],
              ),
              Text(words[tracker][2],
                  style: textStyle(Colors.black, textFontSize)
              )
            ]
        )
    );


  }

  playSentenceAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(sentenceAudio);
  }

  playWordsAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(wordsAudio[tracker]);
  }
}
