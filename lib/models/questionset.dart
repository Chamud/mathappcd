import 'package:mathappcd/models/question.dart';
import 'package:mathappcd/models/section.dart';

class ModelQuestionSet {
  final String _id;
  final String _name;
  final String _number;
  final List<ModelQuestion> _questions = [];

  ModelQuestionSet({
    required String id,
    required String number,
    required String name,
  })  : _id = id,
        _number = number,
        _name = name;

  String get id => _id;
  String get name => _name;
  String get number => _number;
  List<ModelQuestion> get questions => List.unmodifiable(_questions);

  void addChild(ModelQuestion child) {
    _questions.add(child);
  }

  void sortChildren() {
    _questions.sort((a, b) => a.number.compareTo(b.number));
  }
}
