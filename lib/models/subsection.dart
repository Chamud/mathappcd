import 'package:mathappcd/models/questionset.dart';

class ModelSubSection {
  final String _id;
  final String _name;
  final String _number;
  final List<ModelQuestionSet> _questionSets = [];

  ModelSubSection({
    required String id,
    required String number,
    required String name,
  })  : _id = id,
        _number = number,
        _name = name;

  String get id => _id;
  String get name => _name;
  String get number => _number;
  List<ModelQuestionSet> get questionSets => List.unmodifiable(_questionSets);

  void addChild(ModelQuestionSet child) {
    _questionSets.add(child);
  }

  void sortChildren() {
    _questionSets.sort((a, b) => a.number.compareTo(b.number));
  }
}
