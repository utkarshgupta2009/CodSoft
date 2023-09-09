import 'package:flutter/material.dart';
import 'package:quizzy/data/question_list.dart';
import 'package:quizzy/screens/resultScreen.dart';

class quizScreen extends StatefulWidget {
  var showQuiz;
  var showQuizID;

  quizScreen(this.showQuiz, this.showQuizID);

  _quizScreenState createState() {
    return _quizScreenState();
  }
}

class _quizScreenState extends State<quizScreen> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isFalse = Colors.red;
  Color btnColor = const Color(0xff337CCF);

  int getQuestionCount() {
    var count = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].quizID == widget.showQuizID) {
        count++;
      }
    }
    return count;
  }

  var startingIndex;
  var questionCount = 0;
  var onQuestion = 1;
  var score = 0;
  var temp = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].quizID == widget.showQuizID) {
        startingIndex = i;
        break;
      }
    }

    questionCount = getQuestionCount();

    return Scaffold(
        backgroundColor: const Color(0xff191D88),
        appBar: AppBar(
          shadowColor: const Color(0xff191D88),
          backgroundColor: const Color(0xff191D88),
          title: Text(
            widget.showQuiz,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller!,
              onPageChanged: (page) {
                setState(() {
                  isPressed = false;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("$onQuestion/$questionCount",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(questions[startingIndex + temp].question!,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0;
                        i < questions[startingIndex + temp].answers!.length;
                        i++)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: MaterialButton(
                          shape: const StadiumBorder(),
                          height: 60,
                          color: isPressed
                              ? questions[startingIndex + temp]
                                      .answers!
                                      .entries
                                      .toList()[i]
                                      .value
                                  ? isTrue
                                  : isFalse
                              : btnColor,
                          onPressed: () {
                            setState(() {
                              isPressed = true;
                            });
                            if (questions[startingIndex + temp]
                                .answers!
                                .entries
                                .toList()[i]
                                .value) {
                              score++;
                            }
                          },
                          child: Text(
                            questions[startingIndex + temp]
                                .answers!
                                .keys
                                .toList()[i],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                      color: const Color(0xff191D88),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                            height: 60, width: 200),
                        child: ElevatedButton.icon(
                            onPressed: isPressed
                                ? onQuestion == questionCount
                                    ? () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => resultScreen(
                                              score, questionCount),
                                        ));
                                      }
                                    : () {
                                        setState(() {
                                          onQuestion++;
                                          temp++;
                                        });

                                        _controller!.nextPage(
                                            duration: const Duration(
                                                microseconds: 750),
                                            curve: Curves.easeInExpo);
                                      }
                                : null,
                            icon: const Icon(Icons.navigate_next_rounded),
                            label: Text(
                              onQuestion == questionCount ? 'RESULT' : 'NEXT',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              // ignore: deprecated_member_use
                              primary: const Color(0xffFFC436),
                            )),
                      ),
                    ),
                  ],
                );
              },
            )));
  }
}
