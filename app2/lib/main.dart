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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Color textcolor = Colors.white;
  Widget _OutlineButTon(
    String value,
    Color color,
    textcolor,
  ) {
    return Container(
        child: Column(
      children: [
        Row(children: [
          Container(
            margin: EdgeInsets.all(10),
            child: SizedBox(
              width: 70,
              height: 70,
              child: FlatButton(
                onPressed: () {},
                color: color,
                child: Text(value,
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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.end,
          // _OutlineButTon("-"),
          // _OutlineButTon("1"),
          // _OutlineButTon("2"),
          // _OutlineButTon("3"),
          // _OutlineButTon("x"),
          // _OutlineButTon("C"),
          // _OutlineButTon("0"),
          // _OutlineButTon("="),
          // _OutlineButTon("/")
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _OutlineButTon("7", Colors.grey.shade800, textcolor),
                _OutlineButTon("8", Colors.grey.shade800, textcolor),
                _OutlineButTon("9", Colors.grey.shade800, textcolor),
                _OutlineButTon("x", Colors.grey.shade800,
                    textcolor = Colors.green.shade400),
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
                    textcolor = Colors.green.shade400),
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
                _OutlineButTon("=", Colors.green.shade800, textcolor),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
