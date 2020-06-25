import 'package:calculator/calc_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operation = '';
  int total = 0;
  int currentNumber = 0;

  void clearAll() {
    setState(() {
      total = 0;
      operation = '';
    });
  }

  void clearEntry() {
    setState(() {
      total = 0;
    });
  }

  operate(num1, num2, operation) {
    switch(operation) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '÷':
        return num1 / num2;
      case '×':
        return num1 * num2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  operation,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  currentNumber != 0 ? currentNumber.toString() : total.toString(),
                  style: TextStyle(
                    fontSize: 75,
                    color: Colors.white,
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
                  setState(() {
                    operation = '%';
                  });
                },
              ),
              CalcButton(
                color: Colors.orange,
                text: '÷',
                onPressed: () {
                  setState(() {
                    operation = '÷';
                  });
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '7',
                onPressed: () {},
              ),
              CalcButton(
                text: '8',
                onPressed: () {},
              ),
              CalcButton(
                text: '9',
                onPressed: () {},
              ),
              CalcButton(
                color: Colors.orange,
                text: '×',
                onPressed: () {
                  setState(() {
                    operation = '×';
                  });
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '4',
                onPressed: () {},
              ),
              CalcButton(
                text: '5',
                onPressed: () {},
              ),
              CalcButton(
                text: '6',
                onPressed: () {},
              ),
              CalcButton(
                color: Colors.orange,
                text: '-',
                onPressed: () {
                  setState(() {
                    operation = '-';
                  });
                },
              ),
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              CalcButton(
                text: '1',
                onPressed: () {},
              ),
              CalcButton(
                text: '2',
                onPressed: () {},
              ),
              CalcButton(
                text: '3',
                onPressed: () {},
              ),
              CalcButton(
                color: Colors.orange,
                text: '+',
                onPressed: () {
                  setState(() {
                    operation = '+';
                  });
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
                onPressed: () {},
              ),
              CalcButton(
                text: '.',
                onPressed: () {},
              ),
              CalcButton(
                color: Colors.blue,
                text: '=',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
