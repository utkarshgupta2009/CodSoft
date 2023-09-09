import 'package:flutter/material.dart';
import 'package:quizzy/data/quiz_list.dart';
import 'package:quizzy/screens/homePage.dart';
import 'package:quizzy/screens/quiz_screen.dart';

class resultScreen extends StatefulWidget {
  final int score;
  final int totalQues;
  resultScreen(this.score, this.totalQues);

  @override
  _resultScreenState createState() {
    return _resultScreenState();
  }
}

class _resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191D88),
        body: Center(
            child: Column(
          children: [
            Container(
              height: 120,
              width: 220,
              margin: EdgeInsets.all(60),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Text(
                'YOU SCORED ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${widget.score}/${widget.totalQues}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home_rounded),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xffffcd56)),
                label: const Text(
                  "return HOME",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
                },
              ),
            )
          ],
        )));
  }
}
