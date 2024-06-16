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
  String _imagePath= 'assets/dicex.png';

  void _rollDice() {
    HapticFeedback.mediumImpact();
    setState(() {
      _diceResult = (Random().nextInt(6) + 1).toString();
      _imagePath='assets/dice'+_diceResult+'.png';
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
            Image.asset(_imagePath,height: 75,),
            const SizedBox(height: 40),
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
                '丟骰子',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: _rollDice,
            ),
          ],
        ),
      ),
    );
  }
}
