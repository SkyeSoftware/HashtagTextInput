import 'package:flutter/material.dart';
import 'package:hashtag_text/hashtag_input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller;
  FocusNode _focusNode;


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[800], width: 1),
            ),
            padding: EdgeInsets.all(8.0),
            child: HashtagText(
                maxLines: null,
                controller: _controller,
                focusNode: _focusNode,
                style: TextStyle(fontSize: 18, color: Colors.black),
                cursorColor: Colors.red,
                backgroundCursorColor: Colors.red
            ),
          )
      ),
    );
  }
}
