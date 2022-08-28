import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'images/movie_img.png',
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Quicksand',
                      color: Colors.blue,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Find your best Movie.'),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {},
                      repeatForever: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  child: const Text(
                    'Provide the best movie references for your weekend.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: ElevatedButton(
                    child: const Text('Get Started'),
                    onPressed: () {
                      // Aksi ketika button diklik
                    },
                  ),
                ),
              ],
            )
        ),
      )
    );
  }
}