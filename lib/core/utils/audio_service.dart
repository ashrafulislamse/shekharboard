import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Audio Service for TTS playback
class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final AudioPlayer _player = AudioPlayer();
  String _currentVoice = AppConstants.defaultVoice;
  bool _isInitialized = false;

  /// Initialize audio service
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _currentVoice = prefs.getString(AppConstants.keyVoice) ?? AppConstants.defaultVoice;
    
    // Configure audio player
    await _player.setReleaseMode(ReleaseMode.stop);
    await _player.setVolume(1.0);
    
    // Listen for errors
    _player.onLog.listen((msg) {
      debugPrint('AudioPlayer log: $msg');
    });
    
    _player.onPlayerStateChanged.listen((state) {
      debugPrint('AudioPlayer state: $state');
    });
    
    _isInitialized = true;
    debugPrint('AudioService initialized with voice: $_currentVoice');
  }

  /// Get current voice folder path
  String get _voicePath {
    switch (_currentVoice) {
      case 'male':
        return 'audio/bn';
      case 'anime':
        return 'audio/bn-anime';
      case 'female':
      default:
        return 'audio/bn-female';
    }
  }

  /// Play word audio
  Future<void> playWord(String category, String itemId) async {
    if (!_isInitialized) {
      await init();
    }
    
    final path = '$_voicePath/$category/${itemId}_word.mp3';
    
    try {
      await _player.play(AssetSource(path));
    } catch (e) {
      debugPrint('AudioService: Error playing $path - $e');
    }
  }

  /// Play description audio
  Future<void> playDescription(String category, String itemId) async {
    final path = '$_voicePath/$category/${itemId}_desc.mp3';
    debugPrint('AudioService: Playing description audio: $path');
    try {
      await _player.play(AssetSource(path));
    } catch (e) {
      debugPrint('AudioService: Error playing description: $e');
    }
  }

  /// Play feedback audio (correct/wrong/try again)
  Future<void> playFeedback(String feedbackType) async {
    final path = '$_voicePath/feedback/$feedbackType.mp3';
    debugPrint('AudioService: Playing feedback audio: $path');
    try {
      await _player.play(AssetSource(path));
    } catch (e) {
      debugPrint('AudioService: Error playing feedback: $e');
    }
  }

  /// Change voice
  Future<void> setVoice(String voice) async {
    if (AppConstants.availableVoices.contains(voice)) {
      _currentVoice = voice;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.keyVoice, voice);
    }
  }

  /// Get current voice
  String get currentVoice => _currentVoice;

  /// Stop current playback
  Future<void> stop() async {
    await _player.stop();
  }

  /// Dispose player
  void dispose() {
    _player.dispose();
  }
}
