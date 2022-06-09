import 'package:flutter/material.dart';
import 'package:cardguessgame/page/game.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future openDialogHelp() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            '\nA card and a deck is shown in the screen\nYou have to guess if the next card is\ngreater than or equal to\n(>=) or (<) \nless than the current card shown.\nIf you guessed it wrong, the game ends!',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );

  Future openDialogInfo() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            'Activity 7\nFlutter High-Low\nEngr. Christian Lloyd Salon - Instructor\n\nLemuel Jay B. Enad - Student\nBSCPE 3A',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: Center(
          // snackBar: const SnackBar(content: Text('Tap back again to exit')),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background01.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/ui/HiLo.png',
                    ),
                    scale: 3.0,
                    alignment: Alignment(-0.005, -.7),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, FadeRoute(page: GamePage()));
                        },
                        child: Image.asset(
                          'assets/ui/playGIF.gif',
                          scale: 12.0,
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      GestureDetector(
                        onTap: () {
                          openDialogHelp();
                        },
                        child: Image.asset(
                          'assets/ui/helpICON.png',
                          scale: 9.9,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          openDialogInfo();
                        },
                        child: Image.asset(
                          'assets/ui/aboutICON.png',
                          scale: 8.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom fade animation to use when switching pages
class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
