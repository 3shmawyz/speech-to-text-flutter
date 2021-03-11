import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:speechtotext/api/speechapi.dart';
import 'package:clipboard/clipboard.dart';
import 'package:speechtotext/commands.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String displayedtext = "Press the button and speak";
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("SPEECH TO TEXT")),
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () async {
              FlutterClipboard.copy(displayedtext);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(25),
        child: Text(displayedtext,
            style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isRecord();
        },
        child: Icon(
          isListening ? Icons.mic : Icons.mic_none_outlined,
          size: 36,
        ),
      ),
    );
  }

  Future isRecord() {
    return SpeechApi.isRecording(onResult: (text) {
      
      setState(() {
        this.displayedtext = text;
      });
    }, onListening: (isListening) {
      setState(() {
        this.isListening = isListening;
      });
    if (!isListening) {
            Future.delayed(Duration(seconds: 1), () {
              Settings.scantext(displayedtext);
            });
          }   
     });
  }
}
