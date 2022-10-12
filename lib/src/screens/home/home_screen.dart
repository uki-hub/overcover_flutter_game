import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OVER-COVER'),
          Row(
            children: [
              ElevatedButton(onPressed: () => {}, child: Text('PLAY')),
              ElevatedButton(onPressed: () => {}, child: Text('DICTIONARY')),
              ElevatedButton(onPressed: () => {}, child: Text('LEADERBOARD')),
              ElevatedButton(onPressed: () => {}, child: Text('SETTING')),
            ],
          )
        ],
      ),
    );
  }
}