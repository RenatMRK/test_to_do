import 'package:test_to_do/presentation/model/emotion.dart';

class TodoFormUiModel {
  final Emotion emotion;
  final String? feeling;
  final double stressLevel;
  final double selfWorthLevel;
  final String note;

  const TodoFormUiModel({
    required this.emotion,
    this.feeling,
    required this.stressLevel,
    required this.selfWorthLevel,
    required this.note,
  });

  @override
  String toString() {
    return '''
TodoFormUiModel(
  emotion: ${emotion.label},
  feeling: $feeling,
  stressLevel: $stressLevel,
  selfWorthLevel: $selfWorthLevel,
  note: $note
)
''';
  }
}
