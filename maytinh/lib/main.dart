import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Máy tính'),
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
  Widget _OutlineButTon(String value) {
    return Expanded(
        child: OutlineButton(
      onPressed: () {},
      padding: EdgeInsets.all(25.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10)),
      color: Colors.black,
      child: Text(
        value,
        style: TextStyle(fontSize: 25, color: Colors.lightBlue),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                color: Colors.grey,
                padding: EdgeInsets.all(10),
                child: Text("0",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
            ),
            Row(
              children: [
                _OutlineButTon("7"),
                _OutlineButTon("8"),
                _OutlineButTon("9"),
                _OutlineButTon("+")
              ],
            ),
            Row(
              children: [
                _OutlineButTon("4"),
                _OutlineButTon("5"),
                _OutlineButTon("6"),
                _OutlineButTon("-")
              ],
            ),
            Row(
              children: [
                _OutlineButTon("1"),
                _OutlineButTon("2"),
                _OutlineButTon("3"),
                _OutlineButTon("x")
              ],
            ),
            Row(
              children: [
                _OutlineButTon("C"),
                _OutlineButTon("0"),
                _OutlineButTon("="),
                _OutlineButTon("/")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
