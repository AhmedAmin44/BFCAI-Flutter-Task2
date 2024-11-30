import 'package:flutter/material.dart';
import 'package:task/CalculatorPage.dart';
import 'package:task/score.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Navigation between 2 Screens',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CalculatorPage()),
                );
              },
              child: const Text('Go to Screen 1'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScorePage ()),
                );
              },
              child: const Text('Go to Screen 2'),
            ),
            // SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) =>  ()),
            //     );
            //   },
            //   child: const Text('Go to Screen 3'),
            // ),
          ],
        ),
      ),
    );
  }
}
