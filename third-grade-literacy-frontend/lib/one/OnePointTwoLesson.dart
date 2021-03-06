import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/one/quiz/QuizOnePointTwo.dart';
import 'package:hearatale_literacy_app/one/ScoreMenuOne.dart';
import 'package:hearatale_literacy_app/helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointTwoLesson()
  ));
}
class OnePointTwoLesson extends StatefulWidget {
  @override
  OnePointTwo createState() => OnePointTwo();
}
class OnePointTwo extends State<OnePointTwoLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionOne/OnePointTwo/drop.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointTwo/fib.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointTwo/hug.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointTwo/nap.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointTwo/skip.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointTwo/stop.png')];
  var words = [['drop', 'dropped', 'dropping'],
    ['fib', 'fibbed', "fibbing"],
    ['hug', 'hugged', "hugging"],
    ['nap', 'napped', "napping"],
    ['skip', 'skipped', "skipping"],
    ['stop', 'stopped', "stopping"]];
  var music = ["drop_dropped_dropping.mp3",
    "fib_fibbed_fibbing.mp3",
    "hug_hugged_hugging.mp3",
    "nap_napped_napping.mp3",
    "skip_skipped_skipping.mp3",
    "stop_stopped_stopping.mp3"];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#1.2_endwithshortvowel&consonantaddEDorING.mp3';

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
                              pageBuilder: (context, _, __) => QuizOnePointTwo(),
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
                Text('Many action words end with a short vowel and',
                    style: textStyle(Colors.black, screenWidth / 24)
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('consonant. These base words double the final',
                    style: textStyle(Colors.black, screenWidth / 24)
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('consonant and add ',
                  style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('ed ',
                    style: textStyle(Colors.red, screenWidth / 24)
                ),
                Text('or ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('ing',
                    style: textStyle(Colors.red, screenWidth / 24)
                ),
                Text('.',
                    style: textStyle(Colors.black, screenWidth / 24)
                )
              ],
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
