import 'package:flutter/material.dart';
import 'package:test_to_do/presentation/model/emotion.dart';
import 'package:test_to_do/presentation/model/todo_form_ui_model.dart';

class TodoFormController extends ChangeNotifier {
  Emotion? _selectedEmotion;
  String? _selectedFeeling;
  double _stressLevel = 0;
  double _selfWorthLevel = 0;
  String _note = '';

  Emotion? get selectedEmotion => _selectedEmotion;
  String? get selectedFeeling => _selectedFeeling;
  double get stressLevel => _stressLevel;
  double get selfWorthLevel => _selfWorthLevel;
  String get note => _note;

  void setEmotion(Emotion emotion) {
    _selectedEmotion = emotion;
    notifyListeners();
  }

  void setFeeling(String feeling) {
    _selectedFeeling = feeling;
    notifyListeners();
  }

  void setStressLevel(double value) {
    _stressLevel = value;
    notifyListeners();
  }

  void setSelfWorthLevel(double value) {
    _selfWorthLevel = value;
    notifyListeners();
  }

  void setNote(String value) {
    _note = value;
    notifyListeners();
  }

  bool get isValid =>
      _selectedEmotion != null &&
      _selectedFeeling != null &&
      _stressLevel > 0 &&
      _selfWorthLevel > 0 &&
      _note.trim().isNotEmpty;

      
  TodoFormUiModel toUiModel() {
    if (_selectedEmotion == null) {
      throw StateError('Emotion is required');
    }

    return TodoFormUiModel(
      emotion: _selectedEmotion!,
      feeling: _selectedFeeling,
      stressLevel: _stressLevel,
      selfWorthLevel: _selfWorthLevel,
      note: _note,
    );
  }

  void reset() {
    _selectedEmotion = null;
    _selectedFeeling = null;
    _stressLevel = 0;
    _selfWorthLevel = 0;
    _note = '';
    notifyListeners();
  }
}
