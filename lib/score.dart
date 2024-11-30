import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScorePage> {
  int _counterA = 0;
  int _counterB = 0;

  void _incrementCounterA(int value) {
    setState(() {
      _counterA += value;
    });
  }

  void _incrementCounterB(int value) {
    setState(() {
      _counterB += value;
    });
  }

  void _resetCounters() {
    setState(() {
      _counterA = 0;
      _counterB = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Score'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Counter A Section
                Column(
                  children: <Widget>[
                    Text(
                      'Counter A',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '$_counterA',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 20),
                    _buildCustomButton('Add 1 Point', () => _incrementCounterA(1)),
                    SizedBox(height: 10),
                    _buildCustomButton('Add 2 Points', () => _incrementCounterA(2)),
                    SizedBox(height: 10),
                    _buildCustomButton('Add 3 Points', () => _incrementCounterA(3)),
                  ],
                ),
                SizedBox(width: 40),
                // Counter B Section
                Column(
                  children: <Widget>[
                    Text(
                      'Counter B',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '$_counterB',
                      style: TextStyle(fontSize: 50),
                    ),
                    SizedBox(height: 20),
                    _buildCustomButton('Add 1 Point', () => _incrementCounterB(1)),
                    SizedBox(height: 10),
                    _buildCustomButton('Add 2 Points', () => _incrementCounterB(2)),
                    SizedBox(height: 10),
                    _buildCustomButton('Add 3 Points', () => _incrementCounterB(3)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildCustomButton('Reset Counters', _resetCounters, backgroundColor: Colors.red),
          ],
        ),
      ),
    );
  }
  Widget _buildCustomButton(String text, VoidCallback onPressed, {Color backgroundColor = Colors.blue}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
