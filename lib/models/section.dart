import 'package:mathappcd/screens/sub_section.dart';

class ModelSection {
  String id;
  String name;
  String number;
  List<SubSection> subsections = [];

  ModelSection({required this.id, required this.number, required this.name});

  void addchild(SubSection child) {
    subsections.add(child);
  }
}
