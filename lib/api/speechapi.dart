import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final tss = SpeechToText();

  static Future<bool> isRecording({
    Function(String text) onResult,
    ValueChanged<bool> onListening}) async{
    if(tss.isListening){
    tss.stop();
    return true;
    }

    final recorded = await tss.initialize(
      onStatus: (status){
        return onListening(tss.isListening);
      },
      onError: (e) =>print("Error $e")
    );
    
    if(recorded){
     tss.listen(onResult:(value) {
      onResult(value.recognizedWords); 
     });
    }
    return recorded;
  }
}