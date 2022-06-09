import 'package:flutter/material.dart';

class scoreDisplay extends StatelessWidget {
  final int gameScore;

  scoreDisplay(this.gameScore);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        'Score: $gameScore',
        style: const TextStyle(
            fontFamily: 'dogicapixel', color: Colors.black, fontSize: 20),
      ),
    );
  }
}
