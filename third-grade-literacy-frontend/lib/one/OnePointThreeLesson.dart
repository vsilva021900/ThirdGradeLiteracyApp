import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/one/quiz/QuizOnePointThree.dart';
import 'package:hearatale_literacy_app/one/ScoreMenuOne.dart';
import 'package:hearatale_literacy_app/helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointThreeLesson()
  ));
}
class OnePointThreeLesson extends StatefulWidget {
  @override
  OnePointThree createState() => OnePointThree();
}
class OnePointThree extends State<OnePointThreeLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionOne/OnePointThree/bake.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/dance.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/excite.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/move.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/tickle.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointThree/tumble.png')];
  var words = [['bake', 'baked', 'baking'],
    ['dance', 'danced', "dancing"],
    ['excite', 'excited', "exciting"],
    ['move', 'moved', "moving"],
    ['tickle', 'tickled', "tickling"],
    ['tumble', 'tumbled', "tumbling"]];
  var music = ["bake_baked_baking.mp3",
    "dance_danced_dancing.mp3",
    "excite_excited_exciting.mp3",
    "move_moved_moving.mp3",
    "tickle_tickled_tickling.mp3",
    "tumble_tumbled_tumbling.mp3"];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#1.3_manybasewordsendwithEthesewordsdrop.mp3';
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
                                pageBuilder: (context, _, __) => QuizOnePointThree(),
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
                              pageBuilder: (context, _, __) => ScoreOne(),
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
                  Text('Many action words end with e. These words drop',
                      style: textStyle(Colors.black, screenWidth / 25)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('the final e and add ',
                      style: textStyle(Colors.black, screenWidth / 25)
                  ),
                  Text('ed ',
                      style: textStyle(Colors.red, screenWidth / 25)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, screenWidth / 25)
                  ),
                  Text('ing ',
                      style: textStyle(Colors.red, screenWidth / 25)
                  ),
                  Text('to the base word.',
                      style: textStyle(Colors.black, screenWidth / 25)
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
