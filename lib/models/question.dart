import 'package:mathappcd/models/subquestion.dart';

class ModelQuestion {
  final String _id;
  final String _question;
  final String _number;
  final bool _advanced;
  final List<ModelSubQuestion> _subQuestions = [];

  ModelQuestion({
    required String id,
    required String number,
    required String question,
    required bool advanced,
  })  : _id = id,
        _number = number,
        _question = question,
        _advanced = advanced;

  String get id => _id;
  String get question => _question;
  String get number => _number;
  bool get advanced => _advanced;
  List<ModelSubQuestion> get subQuestions => List.unmodifiable(_subQuestions);

  void addChild(ModelSubQuestion child) {
    _subQuestions.add(child);
  }

  void sortChildren() {
    _subQuestions.sort((a, b) => a.number.compareTo(b.number));
  }
}
