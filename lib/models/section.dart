import 'package:mathappcd/models/subsection.dart';

class ModelSection {
  final String _id;
  final String _name;
  final String _number;
  final List<ModelSubSection> _subsections = [];

  ModelSection(
      {required String id, required String number, required String name})
      : _id = id,
        _number = number,
        _name = name;

  String get id => _id;
  String get name => _name;
  String get number => _number;
  List<ModelSubSection> get subsections => List.unmodifiable(_subsections);

  void addChild(ModelSubSection child) {
    _subsections.add(child);
  }

  void sortChildren() {
    _subsections.sort((a, b) => a.number.compareTo(b.number));
  }
}
