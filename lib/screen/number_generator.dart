import 'dart:math';

import 'package:flutter/material.dart';

class NumberGeneratorScreen extends StatefulWidget {
  const NumberGeneratorScreen({super.key});

  @override
  State<NumberGeneratorScreen> createState() => _NumberGeneratorScreenState();
}

class _NumberGeneratorScreenState extends State<NumberGeneratorScreen> {
  Color _color = Colors.blue;
  int _firstNumber = 0;
  int _secondNumber = 0;
  int noOfCount = 1;
  int correctAnswer = 0;
  int incorrectAnswer = 0;
  int clickCount = 0;
  static const int maxClicks = 10;

  @override
  void initState() {
    _generateRandomNumber();
    super.initState();
  }

  void _generateRandomNumber() {
    Random random = Random();
    _firstNumber = random.nextInt(100) + 1;
    _secondNumber = random.nextInt(100) + 1;

    while (_firstNumber == _secondNumber) {
      _secondNumber = random.nextInt(100) + 1;
    }

    noOfCount++;
  }

  void _restartGame() {
    setState(() {
      _color = Colors.blue;
      _firstNumber = 0;
      _secondNumber = 0;
      noOfCount = 1;
      correctAnswer = 0;
      incorrectAnswer = 0;
      clickCount = 0;
      _generateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool canClick = clickCount < maxClicks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canClick ? _color : Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: canClick
                        ? () {
                            setState(() {
                              if (_firstNumber > _secondNumber) {
                                correctAnswer++;
                                _color = Colors.green;
                              } else {
                                incorrectAnswer++;
                                _color = Colors.red;
                              }
                              clickCount++;
                              if (clickCount < maxClicks) {
                                _generateRandomNumber();
                              }
                            });
                          }
                        : null,
                    child: Text(
                      _firstNumber.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 170,
                  height: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: canClick ? _color : Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: canClick
                        ? () {
                            setState(() {
                              if (_secondNumber > _firstNumber) {
                                correctAnswer++;
                                _color = Colors.green;
                              } else {
                                incorrectAnswer++;
                                _color = Colors.red;
                              }
                              clickCount++;
                              if (clickCount < maxClicks) {
                                _generateRandomNumber();
                              }
                            });
                          }
                        : null,
                    child: Text(
                      _secondNumber.toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Correct Answer: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            correctAnswer.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            'Incorrect Answer: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            incorrectAnswer.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _restartGame,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restart_alt_rounded,
                                color: Colors.black),
                            SizedBox(width: 10),
                            Text(
                              'Restart',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
