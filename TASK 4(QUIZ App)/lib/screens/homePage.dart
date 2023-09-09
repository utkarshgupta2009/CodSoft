import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizzy/data/quiz_list.dart';
import 'package:quizzy/screens/quiz_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var temp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191D88),
      appBar: AppBar(
        shadowColor: const Color(0xff191D88),
        backgroundColor: const Color(0xff191D88),
        title: const Text(
          'QUIZZY',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
        color: const Color(0xff191D88),
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(height: 60, width: 200),
          child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  temp = Random().nextInt(quizName.length);
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      quizScreen(quizName[temp][0], quizName[temp][1]),
                ));
              },
              icon: const Icon(Icons.add),
              label: const Text(
                'TAKE RANDOM QUIZ',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                // ignore: deprecated_member_use
                primary: Colors.deepPurpleAccent,
              )),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: quizName.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      quizScreen(quizName[index][0], quizName[index][1]),
                ));
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                // ignore: deprecated_member_use
                primary: const Color(0xff337CCF),
              ),
              child: Text(
                quizName[index][0],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 70,
              color: Color(0xff191D88),
            );
          },
        ),
      ),
    );
  }
}
