import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiChatProvider extends ChangeNotifier {
  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];

  TextEditingController get controller => _controller;
  List<Map<String, dynamic>> get messages => _messages;

  void sendMessage(String message) {
    _messages.add({'message': message, 'isUser': true});
    notifyListeners();

    final gemini = Gemini.instance;
    gemini.text(message).then((value) {
      _messages.add({'message': value?.output ?? 'No response', 'isUser': false});
      _controller.clear();
      notifyListeners();
    }).catchError((e) => print(e));
  }
}