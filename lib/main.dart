import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  String _diceResult = '?';

  void _rollDice() {
    HapticFeedback.vibrate();
    setState(() {
      _diceResult = (Random().nextInt(6) + 1).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('骰子', style: TextStyle(fontFamily: "PingFang TC")),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '骰子數字',
              style: TextStyle(
                fontFamily: "PingFang TC",
                fontSize: 24,
              ),
            ),
            Text(
              '$_diceResult',
              style: TextStyle(
                fontFamily: "SF Pro Display",
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 40),
            CupertinoButton.filled(
              child: const Text(
                '🎲',
                style: TextStyle(fontSize: 40),
              ),
              onPressed: _rollDice,
            ),
          ],
        ),
      ),
    );
  }
}
