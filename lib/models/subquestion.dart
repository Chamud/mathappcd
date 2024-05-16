class ModelSubQuestion {
  final String _id;
  final String _number;
  final String _answer;
  final String _question;

  ModelSubQuestion({
    required String id,
    required String number,
    required String answer,
    required String question,
  })  : _id = id,
        _number = number,
        _answer = answer,
        _question = question;

  String get id => _id;
  String get number => _number;
  String get answer => _answer;
  String get question => _question;
}
