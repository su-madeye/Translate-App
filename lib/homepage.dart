import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleTranslator translator = new GoogleTranslator();

  String _originaltext = '';
  String _changedtext = '';

  _translate(String text) {
    translator.translate(text, to: 'hi').then((value) {
      setState(() {
        _changedtext = value.toString();
      });
      print(_changedtext);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator'),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            // color: Colors.blue,
            child: SafeArea(
              minimum: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text here',
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _originaltext = value.toString();
                  });
                  _translate(_originaltext);
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.blue,
            child: SafeArea(
              minimum: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Text(
                _changedtext,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
