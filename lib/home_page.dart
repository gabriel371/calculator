import 'dart:async';
import 'dart:convert';

import 'package:calculator/calc_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operation = '';
  int total = 0;
  List<String> currentNumbers = [];
  Color stringColor = Colors.white;
  String waitingNumber = '';

  void clearAll() {
    setState(() {
      waitingNumber = '';
      total = 0;
      currentNumbers = [];
      operation = '';
    });
  }

  void clearEntry() {
    setState(() {
      total = 0;
      currentNumbers = [];
    });
  }

  void addNumber(String number) {
    if (currentNumbers.length <= 8) {
      setState(() {
        currentNumbers.add(number);
      });
    } else {
      setState(() {
        stringColor = Colors.red;
      });
      colorTimeout();
    }
  }

  colorTimeout() {
    return Timer(Duration(milliseconds: 1000),
        () => setState(() => stringColor = Colors.white));
  }

  setDivision(String numbers) {
    setState(() {
      waitingNumber = numbers;
      operation = '÷';
      currentNumbers = [];
    });
  }

  setMultiplication(String numbers) {
    setState(() {
      waitingNumber = numbers;
      operation = '×';
      currentNumbers = [];
    });
  }

  setSubtraction(String numbers) {
    setState(() {
      waitingNumber = numbers;
      operation = '-';
      currentNumbers = [];
    });
  }

  setAddition(String numbers) {
    setState(() {
      waitingNumber = numbers;
      operation = '+';
      currentNumbers = [];
    });
  }

  String joinNumbers() {
    return currentNumbers.isNotEmpty
        ? currentNumbers.reduce((value, element) => value + element)
        : '0';
  }

  equal(String numbers) {
    if (operation == '÷') {
      setState(() {
        currentNumbers = [(int.parse(waitingNumber) / int.parse(numbers)).toString()];
      });
    }
    if (operation == '×') {
      setState(() {
        currentNumbers = [(int.parse(waitingNumber) * int.parse(numbers)).toString()];
      });
    }
    if (operation == '-') {
      setState(() {
        currentNumbers = [(int.parse(waitingNumber) - int.parse(numbers)).toString()];
      });
    }
    if (operation == '+') {
      setState(() {
        currentNumbers = [(int.parse(waitingNumber) + int.parse(numbers)).toString()];
      });
    }
  }

  percentage(String numbers) {
    setState(() {
      currentNumbers = [(int.parse(numbers) / 100).toString()];
    });
  }

  @override
  Widget build(BuildContext context) {
    String numbersInt = joinNumbers();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  waitingNumber + ' ' + operation,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  currentNumbers.isEmpty ? 0.toString() : numbersInt,
                  style: TextStyle(
                    fontSize: 70,
                    color: stringColor,
                  ),
                ),
              ],
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                color: Colors.orange,
                text: 'C',
                onPressed: () {
                  clearAll();
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: 'CE',
                onPressed: () {
                  clearEntry();
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: '%',
                onPressed: () {
                  percentage(numbersInt);
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: '÷',
                onPressed: () {
                  setDivision(numbersInt);
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '7',
                onPressed: () {
                  addNumber('7');
                },
              ),
              CalcButton(
                text: '8',
                onPressed: () {
                  addNumber('8');
                },
              ),
              CalcButton(
                text: '9',
                onPressed: () {
                  addNumber('9');
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: '×',
                onPressed: () {
                  setMultiplication(numbersInt);
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '4',
                onPressed: () {
                  addNumber('4');
                },
              ),
              CalcButton(
                text: '5',
                onPressed: () {
                  addNumber('5');
                },
              ),
              CalcButton(
                text: '6',
                onPressed: () {
                  addNumber('6');
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: '-',
                onPressed: () {
                  setSubtraction(numbersInt);
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '1',
                onPressed: () {
                  addNumber('1');
                },
              ),
              CalcButton(
                text: '2',
                onPressed: () {
                  addNumber('2');
                },
              ),
              CalcButton(
                text: '3',
                onPressed: () {
                  addNumber('3');
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: '+',
                onPressed: () {
                  setAddition(numbersInt);
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '0',
                flex: 2,
                onPressed: () {
                  if (numbersInt != '0') {
                    addNumber('0');
                  }
                },
              ),
              CalcButton(
                text: '.',
                onPressed: () {
                  if (currentNumbers.isEmpty) {
                    addNumber('0.');
                  } else {
                    currentNumbers.toString().contains('.')
                        ? addNumber('')
                        : addNumber('.');
                  }
                },
              ),
              CalcButton(
                color: Colors.blue,
                text: '=',
                onPressed: () {
                  equal(numbersInt);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
