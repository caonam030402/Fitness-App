import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  String _currentSong = 'audios/test.mp3';

  String get currentSong => _currentSong;

  void changeSong(String newSong) {
    _currentSong = newSong;
    notifyListeners();
  }
}
