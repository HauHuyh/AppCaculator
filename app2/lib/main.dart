// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Máy Tính 2.0'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstNum = 0;
  double secondNum = 0;
  String history = "";
  String textToDisplay = "";
  String reset = "";
  String operation = "";
  Color textcolor = Colors.white;
  bool clickbtnTime = true;
  bool clickbtnDelete = true;

  void btnOnClick(String btnval) {
    print(btnval);

    if (btnval == "C") {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = " ";
      reset = " ";
      history = " ";
    } else if (btnval == ',') {
      reset = textToDisplay + '.';
      // } else if (btnval == '( )') {
      //   reset = textToDisplay + '(';
    } else if (btnval == '+/-') {
      if (textToDisplay[0] != '-') {
        reset = '-' + textToDisplay;
      } else {
        reset = textToDisplay.substring(1);
      }
    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == 'x' ||
        btnval == ':' ||
        btnval == '%') {
      firstNum = double.parse(textToDisplay);
      reset = " ";
      operation = btnval;
    } else if (btnval == '=') {
      secondNum = double.parse(textToDisplay);
      if (operation == '+') {
        reset = (firstNum + secondNum).toString();
        history =
            (firstNum.toString() + operation.toString() + secondNum.toString());
      }
      if (operation == '-') {
        reset = (firstNum - secondNum).toString();
        history =
            (firstNum.toString() + operation.toString() + secondNum.toString());
      }
      if (operation == 'x') {
        reset = (firstNum * secondNum).toString();
        history =
            (firstNum.toString() + operation.toString() + secondNum.toString());
      }
      if (operation == ':') {
        reset = (firstNum / secondNum).toString();
        history =
            (firstNum.toString() + operation.toString() + secondNum.toString());
      }
      if (operation == '%') {
        reset = ((firstNum * 0.01) * secondNum).toString();
        history =
            (firstNum.toString() + operation.toString() + secondNum.toString());
      }
    } else {
      reset = double.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = reset;
    });
  }

  Widget btnTime() {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [Text(history)])
      ],
    );
  }

  Widget _OutlineButTon(
    text,
    Color color,
    textcolor,
  ) {
    return Container(
        child: Column(
      children: [
        Row(children: [
          Container(
            margin: EdgeInsets.all(7),
            child: SizedBox(
              width: 70,
              height: 70,
              child: FlatButton(
                onPressed: () {
                  btnOnClick(text);
                },
                color: color,
                child: Text(text,
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                      fontSize: 24,
                      color: textcolor,
                    ))),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0)),
              ),
            ),
          )
        ])
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/app1.png'),
            fit:BoxFit.cover,
          )),
          child: Center(
            child: Column(
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
                  alignment: Alignment.topRight,
                  child: Text(textToDisplay,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.rubik(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 36))),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  alignment: Alignment.topRight,
                  child: Text(history,
                      style: GoogleFonts.rubik(
                          textStyle:
                              TextStyle(color: Colors.grey, fontSize: 18))),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 50, 30, 30),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 2.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {
                                  clickbtnTime = !clickbtnTime;
                                  if (clickbtnTime == true) {
                                    btnTime();
                                  }
                                  setState(() {});
                                },
                                icon: Icon(clickbtnTime
                                    ? Icons.access_time
                                    : Icons.calculate),
                                color: Colors.grey.shade700),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.horizontal_rule),
                                color: Colors.grey.shade700),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calculate),
                                color: Colors.grey.shade700),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(250, 00, 00, 00),
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                onPressed: () {
                                  clickbtnDelete = !clickbtnDelete;
                                  if (clickbtnTime == true) {
                                    reset = textToDisplay.substring(
                                        0, textToDisplay.length - 1);
                                  }
                                  setState(() {
                                    textToDisplay = reset;
                                  });
                                },
                                icon: Icon(Icons.cancel_outlined),
                                color: Colors.grey.shade700),
                          ),
                        ],
                      )),
                  alignment: Alignment(1.0, 1.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey.shade800))),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _OutlineButTon("C", Colors.red.shade600, textcolor),
                    _OutlineButTon("( )", Colors.grey.shade800,
                        textcolor = Colors.lightGreen.shade400),
                    _OutlineButTon("%", Colors.grey.shade800, textcolor),
                    _OutlineButTon(":", Colors.grey.shade800,
                        textcolor = Colors.lightGreen.shade400),
                  ],
                )),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _OutlineButTon(
                        "7", Colors.grey.shade800, textcolor = Colors.white),
                    _OutlineButTon("8", Colors.grey.shade800, textcolor),
                    _OutlineButTon("9", Colors.grey.shade800, textcolor),
                    _OutlineButTon("x", Colors.grey.shade800,
                        textcolor = Colors.lightGreen.shade400),
                  ],
                )),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _OutlineButTon(
                        "4", Colors.grey.shade800, textcolor = Colors.white),
                    _OutlineButTon("5", Colors.grey.shade800, textcolor),
                    _OutlineButTon("6", Colors.grey.shade800, textcolor),
                    _OutlineButTon("-", Colors.grey.shade800,
                        textcolor = Colors.lightGreen.shade400),
                  ],
                )),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _OutlineButTon(
                        "1", Colors.grey.shade800, textcolor = Colors.white),
                    _OutlineButTon("2", Colors.grey.shade800, textcolor),
                    _OutlineButTon("3", Colors.grey.shade800, textcolor),
                    _OutlineButTon("+", Colors.grey.shade800,
                        textcolor = Colors.lightGreen.shade400),
                  ],
                )),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _OutlineButTon(
                        "+/-", Colors.grey.shade800, textcolor = Colors.white),
                    _OutlineButTon("0", Colors.grey.shade800, textcolor),
                    _OutlineButTon(",", Colors.grey.shade800, textcolor),
                    _OutlineButTon("=", Colors.lightGreen.shade400, textcolor),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
