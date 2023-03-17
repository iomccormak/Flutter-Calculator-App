import 'package:flutter/material.dart';
import 'package:calculator_app/expression.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  @override
  State<CalculatorApp> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<CalculatorApp> {
  Exp expression = Exp();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: _buildAppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          //padding: EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  child: Text(
                    'Scroll to see full expression',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    expression.getExpression(),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('C'),
                    _buildButton('('),
                    _buildButton(')'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('<='),
                    _buildButton('='),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(String data) {
    Color buttonColor;

    if (data == '*' ||
        data == '/' ||
        data == '+' ||
        data == '-' ||
        data == '=') {
      buttonColor = Colors.orange;
    } else {
      if (data == 'C' || data == '(' || data == ')' || data == 'null') {
        buttonColor = Colors.grey;
      } else {
        buttonColor = Color.fromARGB(255, 54, 54, 54);
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        fixedSize: Size(73, 73),
        minimumSize: Size(60, 60),
      ),
      child: Text(
        data,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        setState(() {
          expression.setExpression(data);
        });
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 20,
          ),
          Container(
            height: 10,
            width: 15,
          ),
          Text(
            'Flutter Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange,
    );
  }
}
